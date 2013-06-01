class FxCompaniesController < ApplicationController
  # GET /fx_companies
  # GET /fx_companies.json
  def index
    @fx_companies = FxCompany.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fx_companies }
    end
  end

  # GET /fx_companies/1
  # GET /fx_companies/1.json
  def show
    @fx_company = FxCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fx_company }
    end
  end

  # GET /fx_companies/new
  # GET /fx_companies/new.json
  def new
    @fx_company = FxCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fx_company }
    end
  end

  # GET /fx_companies/1/edit
  def edit
    @fx_company = FxCompany.find(params[:id])
  end

  # POST /fx_companies
  # POST /fx_companies.json
  def create
    @fx_company = FxCompany.new(params[:fx_company])

    respond_to do |format|
      if @fx_company.save
        format.html { redirect_to @fx_company, notice: 'Fx company was successfully created.' }
        format.json { render json: @fx_company, status: :created, location: @fx_company }
      else
        format.html { render action: "new" }
        format.json { render json: @fx_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fx_companies/1
  # PUT /fx_companies/1.json
  def update
    @fx_company = FxCompany.find(params[:id])

    respond_to do |format|
      if @fx_company.update_attributes(params[:fx_company])
        format.html { redirect_to @fx_company, notice: 'Fx company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fx_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fx_companies/1
  # DELETE /fx_companies/1.json
  def destroy
    @fx_company = FxCompany.find(params[:id])
    @fx_company.destroy

    respond_to do |format|
      format.html { redirect_to fx_companies_url }
      format.json { head :no_content }
    end
  end
end
