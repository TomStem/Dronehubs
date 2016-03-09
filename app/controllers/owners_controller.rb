class OwnersController < ApplicationController
  def index
    @owners = user.owner.all
  end

  def show
    @owner = user.owner.find(params[:id])
  end
end
