module Inquirer
  class JobsController < ApplicationController
    def index
      @jobs = current_user.jobs
    end

    def create
    end

    def new
    end

    def show
      @job = Job.find(params[current_user])
    end

    def update
    end

    def destroy
    end
  end
end
