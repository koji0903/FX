# -*- coding: utf-8 -*-
require 'net/http'
require 'open-uri'
Net::HTTP.version_1_2

class HistoricalsController < ApplicationController

  def getCSV
    @fx_company = FxCompany.find(params[:fx_company_id])
    @exchange = Exchange.find(params[:exchange_id])
    @historicals = Historical.all

    # Historical CSV Data URL
    @csv_url =  @fx_company.url + @exchange.path

    @lines = Array.new
    open(@csv_url).each_with_index do |line,i|
      next if i == 0 # Comment Line

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
    @fx_company = FxCompany.find(params[:fx_company_id])
    @exchange = Exchange.find(params[:exchange_id])
    @historicals = Historical.find(:all,
                                   :conditions => [ "fx_company_id = ? and exchange_id = ?" ,
                                                    params[:fx_company_id], params[:exchange_id] ])
    @historicals = @historicals.sort_by{|h| - h.date.to_s.gsub("-","").to_i }

  end

end
