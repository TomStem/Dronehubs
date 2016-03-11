module Inquirer
  class JobsController < ApplicationController
    def index
      @jobs = current_user.jobs
    end

    def show
      @job = Job.find(params[:id])
    end

    def new
      @job = Job.new
    end
    
    def create
      @job = Job.new(job_params)
      @job.user = current_user
      @job.save!
      redirect_to inquirer_jobs_path(@job)
    end

    def update
    end

    def destroy
    end

    private

    def job_params
      params.require(:job).permit(:description, :location, :date, :user_id)
    end
  end
end
