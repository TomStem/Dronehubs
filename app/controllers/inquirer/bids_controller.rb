module Inquirer
  class BidsController < ApplicationController
    def accept
      @bid = Bid.find(params[:id])
      @job = Job.find(params[:job_id])
      @bid.status = "accepted"
      @bid.save!
      redirect_to job_path(@job)
    end

    private

    def bid_params
      params.require(:bid).permit(:status, :id, :job_id)
    end
  end
end
