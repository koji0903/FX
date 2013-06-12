# -*- coding: utf-8 -*-
require 'net/http'
require 'open-uri'
Net::HTTP.version_1_2

require 'fileutils'

class HistoricalsController < ApplicationController

  def index
  end

  def getCSV
    @fx_company = FxCompany.find(params[:fx_company_id])
    @exchange = Exchange.find(params[:exchange_id])
    @historicals = Historical.all

    # Historical CSV Data URL
    @csv_url =  @fx_company.url + @exchange.path

    # Save File
    csv_data = Array.new
    new_file = "files/historical_data/tmp" 
    f = open(new_file,"w")
    open(@csv_url).each_with_index do |line,i|
      next if i == 0 # Comment Line
      f.printf line
      csv_data << line
    end    
    f.close

    # Compare
    base_file = "files/historical_data/" + @exchange.kind.gsub("/","_") + ".csv"
    if File.exist?(base_file)
      base_data = IO.readlines(base_file)
      new_data = IO.readlines(new_file)
      if base_data == new_data
        FileUtils.rm(new_file)
        return
      end
    else
      FileUtils.mv(new_file,base_file)
    end

    @lines = Array.new
    csv_data.each_with_index do |line,i|
      each_data = line.split(",")

      @historical = Historical.new
      @historical.date = each_data[0].gsub("/","-")
      @historical.start = each_data[1]
      @historical.highest = each_data[2]
      @historical.lowest = each_data[3]
      @historical.end = each_data[4]
      @historical.change = @historical.end - @historical.start
      @historical.fx_company_id = params[:fx_company_id]
      @historical.exchange_id = params[:exchange_id]

      if Historical.find(:all, 
                         :conditions => ["date = ? and fx_company_id = ? and exchange_id = ?" ,
                                         @historical.date, @historical.fx_company_id, @historical.exchange_id ]
                         ).blank?
        if @historical.save
        else
        end        
      end
#
#      @match_data = Historical.find_by_date(@historical.date).nil?
#      if @match_data.nil?
#        @match_data = Historical.find_by_date(@historical.date).nil?        
#        if @historical.save
#        else
#        end
#      end
    end
  end

  def view
    getCSV

    @fx_company = FxCompany.find(params[:fx_company_id])
    @exchange = Exchange.find(params[:exchange_id])
    @historicals = Historical.find(:all,
                                   :conditions => [ "fx_company_id = ? and exchange_id = ?" ,
                                                    params[:fx_company_id], params[:exchange_id] ])
    @historicals = @historicals.sort_by{|h| - h.date.to_s.gsub("-","").to_i }

  end

end
