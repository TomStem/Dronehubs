class PilotsController < ApplicationController
  def index
    @owners = User.where(owner: true)
  end

  def show
    @owner = User.find(params[:id])
  end
end
