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

    def edit
      @job = Job.find(params[:id])
    end

    def update
      @job = Job.find(params[:id])
      @job.update(job_params)
      redirect_to inquirer_jobs_path(@job)
    end

    def destroy
      @job = Job.find(params[:id])
      @job.destroy
      redirect_to inquirer_jobs_path
    end

    private

    def job_params
      params.require(:job).permit(:description, :location, :date, :user_id)
    end
  end
end
