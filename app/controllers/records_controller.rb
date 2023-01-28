class RecordsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @record = Record.new
    @housework = Housework.find(params[:housework_id])
    @records = @housework.records.includes(:user)
  end

  def create
    @housework = Housework.find(params[:housework_id])
    @record = @housework.records.new(record_params)
    if @record.save
      redirect_to housework_records_path(@housework)
    else
      @records = @housework.records.includes(:user)
      render :index
    end
  end



  private

  def record_params
    params.require(:record).permit(:content).merge(user_id: current_user.id)
  end
end
