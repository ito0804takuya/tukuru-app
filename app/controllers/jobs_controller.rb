class JobsController < ApplicationController
  def index
    @all_jobs = Job.all.page(params[:page]).per(4).order('updated_at DESC')
  end

  def new
    @job = Job.new
    @image = @job.images.build
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def job_params
    params
      .require(:job)
      .permit(:name, :body, :tel, :email, :url, :postal_code, :city, :block, :bulding, :prefecture_id, images_attributes: [:id, :image] )
      .merge(company_id: current_company.id)
  end
end
