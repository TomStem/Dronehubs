class PilotsController < ApplicationController
  skip_before_action :authenticate_user!
  # def index
  #   @owners = User.select{|u| u.owner && u.location == params[:search]}
  # end

   def index
    if params[:what] != "pilot"
       @owners = User.select{|u| u.owner && u.location == params[:search]}
      if params[:search]
        # Search is location based 
        @users = User.search(params[:search]).order("created_at DESC")
      elsif params[:category]
        # Search is category based 
        @selected_category = Category.find_by(name: params[:category])
        @users = User.select{|j| j.categories.map{|c| c.name}.include?(params[:category])}
      else
        @users = User.all.order("created_at DESC")
      end
    else
      redirect_to pilots_path(search: params[:search])
    end
  end

  def show
    @owner = User.find(params[:id])
  end
end
