class PilotsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @owners = User.where(owner: true)
  end

  def show
    @owner = User.find(params[:id])
  end
end
