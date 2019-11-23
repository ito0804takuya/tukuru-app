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

  def show
    @job = Job.find(params[:id])
    # @image = Image.where(job_id: params[:id])
    # @saler = User.find(@item.saler_id)
    # @category = @item.categories[0]
    # @address = Address.find_by(user_id: @saler.id)
    # @salers_item = Item.where(saler_id: @saler.id)
    # @order_count = @salers_item.where.not(buyer_id: nil).count
  end

  def edit
  end
  
  private
  def job_params
    params
      .require(:job)
      .permit(:name, :body, :tel, :email, :url, :postal_code, :city, :block, :bulding, :prefecture_id, images_attributes: [:id, :image] )
      .merge(company_id: current_company.id)
  end
end
