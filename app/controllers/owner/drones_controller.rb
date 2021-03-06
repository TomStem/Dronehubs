class Owner::DronesController < ApplicationController
  respond_to :js, only: [:edit]
  def index
    @drones = current_user.drones
  end

  def show
    @drone = Drone.find(params[:id])
  end

  def new
    @drone = Drone.new
    @owner = current_user
  end

  def create
    @drone = Drone.new(drone_params)
    @drone.user = current_user
    @drone.save!
    redirect_to owner_profile_path
  end

  def edit
    @drone = Drone.find(params[:id])
  end

  def update
    @drone = Drone.find(params[:id])
    @drone.update!(drone_params)
    redirect_to owner_profile_path
  end

  def destroy
    @drone = Drone.find(params[:id])
    @drone.destroy!
    redirect_to owner_profile_path
  end

  private

  def drone_params
    params.require(:drone).permit(:brand, :model, :camera, :user_id, :photo, :photo_cache)
  end

end
