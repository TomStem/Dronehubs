class BidsController < ApplicationController
  def new
    @bid = Bid.new
    @drones = available_drones
    @owner = current_user
  end

  def create
    @drones = available_drones
    @bid = Bid.new(params.require(:bid).permit(:amount, :description, :drone_id))
    @bid.user = current_user
    @bid.save!
    redirect_to jobs_path
  end

  private

  def available_drones
    Drone.select do |drone|
      drone unless @job.drones.include?(drone)
    end
  end
end