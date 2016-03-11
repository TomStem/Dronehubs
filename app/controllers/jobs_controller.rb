class JobsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @jobs = Job.all
    if params[:search]
      @jobs = Job.search(params[:search]).order("created_at DESC")
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
end