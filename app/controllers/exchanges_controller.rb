class ExchangesController < ApplicationController
  def create
    @fx_company = FxCompany.find(params[:fx_company_id])
    @exchange = @fx_company.exchanges.create(params[:exchange])
    redirect_to fx_company_path(@fx_company)
  end

  def destroy
    @fx_company = FxCompany.find(params[:fx_company_id])
    @exchange = @fx_company.exchanges.find(params[:id])
    @exchange.destroy
    redirect_to fx_company_path(@fx_company)
  end

  def show
    @fx_company = FxCompany.find(params[:fx_company_id])
    @exchange = Exchange.find(params[:id])
    @exchange_id = params[:id]
    @fx_company_id = params[:fx_company_id]
  end
end
