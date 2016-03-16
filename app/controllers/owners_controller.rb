class OwnersController < ApplicationController
  def index
    users = User.all
    @owners = []
    users.each do |user|
      if user.owner == true
      @owners << user
      end
    end
  end

  def show
    @owner = user.owner.find(params[:id])
  end
end
