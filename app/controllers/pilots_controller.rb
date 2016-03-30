class PilotsController < ApplicationController
  skip_before_action :authenticate_user!
  # def index
  #   @owners = User.select{|u| u.owner && u.location == params[:search]}
  # end

   def index
    if params[:what] != "pilot"
      @owners = User.owners

      if params[:search]
        # Search is location based 
        @owners = @owners.search(params[:search]).order("created_at DESC")
      elsif params[:category]
        # Search is category based 
        @selected_category = Category.find_by(name: params[:category])
        @owners = @owners.joins(:categories).where(categories: { id: @selected_category.id })
      else
        @owners = @owners.all.order("created_at DESC")
      end
    else
      redirect_to pilots_path(search: params[:search])
    end
  end

  def show
    @owner = User.find(params[:id])
  end
end
