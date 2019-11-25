class JobsController < ApplicationController
  before_action :authenticate_company!, except: [:index, :show]
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    @all_jobs = Job.all.page(params[:page]).per(16).order('updated_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    if @job.company_id == current_company.id && @job.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private
  def job_params
    params
      .require(:job)
      .permit(:name, :body, :tel, :email, :url, :postal_code, :city, :block, :bulding, :prefecture_id, images_attributes: [:id, :image] )
      .merge(company_id: current_company.id)
  end

  def find_job
    @job = Job.find(params[:id])
  end
end
