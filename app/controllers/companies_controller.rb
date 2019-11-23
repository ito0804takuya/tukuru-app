class CompaniesController < ApplicationController
  before_action :company_params, only: [:show] 

  def show
  end

  private

  def company_params
    @company = Company.find(params[:id])
  end
end
