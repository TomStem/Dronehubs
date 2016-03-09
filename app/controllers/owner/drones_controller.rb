class Owner::DronesController < ApplicationController
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
    redirect_to owner_drones_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def drone_params
    params.require(:drone).permit(:brand, :model, :camera, :user_id)
  end

end
