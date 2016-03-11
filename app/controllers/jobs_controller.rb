class JobsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def latest
    # get a list of 3 jobs that have been posted latest
    @jobs = Job.latest
  end
end