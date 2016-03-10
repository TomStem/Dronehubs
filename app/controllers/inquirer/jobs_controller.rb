module Inquirer
  class JobsController < ApplicationController
    def index
      @jobs = current_user.jobs
    end

    def create
      @job = Job.create!(job_params)
      redirect_to inquirer_jobs_path(@job)
    end

    def new
      @job = Job.new
    end

    def show
      @job = Job.find(params[current_user])
    end

    def update
    end

    def destroy
    end

    private

    def job_params
      params.require(:job).permit(:description, :location, :date)
    end
  end
end
