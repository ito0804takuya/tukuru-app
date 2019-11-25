class SeekersController < ApplicationController
  before_action :authenticate_seeker!, except: [:new]
  before_action :seeker_params, only: [:show] 

  def show
  end

  private

  def seeker_params
    @seeker = Seeker.find(params[:id])
  end
end
