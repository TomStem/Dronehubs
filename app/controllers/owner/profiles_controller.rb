class Owner::ProfilesController < ApplicationController
  def show
    @owner = current_user
    @bids_amount = 0
    @jobs_amount = 0
    @jobs = []
    @bids = []

    @owner.drones.each do |drone|
      @bids_amount += drone.bids.size
      drone.bids.each do |bid|
        @bids << bid
      end
    end

    @owner.drones.each do |drone|
      drone.bids.each do |bid|
        if bid.status == "accepted"
          @jobs << { job: bid.job, drone: bid.drone }
          @jobs_amount += 1
        end
      end
    end

  end

  def edit
    @owner = current_user
  end

  def update
    @owner = current_user
    @owner.update(profile_params)
    if @owner.owner == true
      redirect_to owner_profile_path
    else
      redirect_to inquirer_jobs_path
    end
  end

  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :description, :location, :profile_pic, :profile_pic_cache, :banner_pic, :banner_pic_cache)

  end

end

