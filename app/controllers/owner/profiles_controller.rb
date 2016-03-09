class Owner::ProfilesController < ApplicationController
  def show
    @users = User.all
    @owners = User.where(owner: true)
    @owner = current_user
  end

  def edit
  end

  def update
  end
end
