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
      @historical.date = each_data[0]
      @historical.start = each_data[1]
      @historical.highest = each_data[2]
      @historical.lowest = each_data[3]
      @historical.end = each_data[4]
      @historical.change = @historical.end - @historical.start

      if Historical.find_by_date(@historical.date).nil?
        if @historical.save
        else
        end
      end
    end
  end

  def view
    @fx_company = FxCompany.find(params[:fx_company_id])
    @exchange = Exchange.find(params[:exchange_id])
    @historicals = Historical.all
  end

end
