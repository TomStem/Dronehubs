class JobsController < ApplicationController
  before_action :set_drones

  def index
    if params[:what] != "pilot"
      if params[:search]
        # Search is location based 
        @jobs = Job.search(params[:search]).order("created_at DESC")
      elsif params[:category]
        # Search is category based 
        @selected_category = Category.find_by(name: params[:category])
        @jobs = Job.joins(:categories).where(categories: { id: @selected_category.id })
      else
        @jobs = Job.all.order("created_at DESC")
      end
    else
      redirect_to pilots_path(search: params[:search])
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def latest
    # get a list of 3 jobs that have been posted latest
    @jobs = Job.latest
  end

  private

  def set_drones
    @drones = current_user.drones
  end
end

