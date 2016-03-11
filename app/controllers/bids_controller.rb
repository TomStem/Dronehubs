class BidsController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @bid = Bid.new
    @drones = available_drones
    @owner = current_user
  end

  def create
    @job = Job.find(params[:job_id])
    @drones = available_drones
    @bid = Bid.new(bid_params)
    @bid.job = @job
    @bid.save!
    redirect_to jobs_path
  end

  private

  def available_drones
    Drone.select do |drone|
      drone unless @job.drones.include?(drone)
    end
  end

  def bid_params
    params.require(:bid).permit(:amount, :description, :job_id, :drone_id)
  end
end
