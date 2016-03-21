class PilotsController < ApplicationController
  def index
    @owners = User.where(owner: true)
  end

  def show
    @owner = user.owner.find(params[:id])
  end
end
