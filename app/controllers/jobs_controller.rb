class JobsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

end