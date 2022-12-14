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

  def destroy
    housework = Housework.find(params[:id])
    housework.destroy
    redirect_to root_path
  end

  private
  def housework_params
    params.require(:housework).permit(:image, :housework_name, :housework_type, :buy_date, :parts_name, :parts_type, :exchange, user_ids: [])
  end
end
