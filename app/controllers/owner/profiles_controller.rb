class Owner::ProfilesController < ApplicationController
  def show
    @owner = current_user
  end

  def edit
  end

  def update
  end
end