class Owner::ProfilesController < ApplicationController
  def show
    @owner = current_user
    @bids_amount = 0
    @jobs_amount = 0
    @jobs = []

    @owner.drones.each do |drone|
      @bids_amount += drone.bids.size
    end

    @owner.drones.each do |drone|
      drone.bids.each do |bid|
        if bid.status == "accepted"
          @jobs << bid.job
          @jobs_amount += 1
        end
      end
    end

  end

  def edit
  end

  def update
  end
end
