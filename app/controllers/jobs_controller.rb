class JobsController < ApplicationController
  before_action :set_drones

  def index
    @jobs = Job.all

    if params[:search]
      @jobs = Job.search(params[:search]).order("created_at DESC")
      @jobs = Job.where(:category => params[:category])
    else
      @jobs = Job.all.order("created_at DESC")
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