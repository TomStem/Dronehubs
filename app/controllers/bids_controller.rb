class BidsController < ApplicationController
  def new
    @bid = Bid.new
  end

  def create
    if user.owner
      @bid = Bid.create!(bid_params)

      redirect_to job_path(@job)
    else
  end
end