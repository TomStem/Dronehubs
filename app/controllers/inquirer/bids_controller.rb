module Inquirer
  class BidsController < ApplicationController
    def update
      @bid = Bid.find(params[:id])
      @job = Job.find(params[:job_id])
      @bid.update!(bid_params)
      redirect_to inquirer_job_path(@job)
    end

    private

    def bid_params
      params.require(:bid).permit(:status)
    end
  end
end
