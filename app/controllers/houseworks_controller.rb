class HouseworksController < ApplicationController

  def index
  end

  def new
    @housework = Housework.new
  end

  def create
    @housework = Housework.new(housework_params)
    if @housework.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def housework_params
    params.require(:housework).permit(:image, :name, :housework_name, :housework_type, :buy_date, :parts_name, :parts_type, :exchange, user_ids: [])
  end
end
