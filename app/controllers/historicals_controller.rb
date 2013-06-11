# -*- coding: utf-8 -*-
require 'net/http'
require 'open-uri'
Net::HTTP.version_1_2

class HistoricalsController < ApplicationController

  def getCSV
    @fx_company = FxCompany.find(params[:fx_company_id])
    @exchange = Exchange.find(params[:exchange_id])

    # Historical CSV Data URL
    @csv_url =  @fx_company.url + @exchange.path

    @lines = Array.new
    open(@csv_url).each_with_index do |line,i|
      next if i == 0 # Comment Line
      @lines << line
    end
  end

end
