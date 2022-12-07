class RecordsController < ApplicationController
  def index
    @record = Record.new
    @housework = Housework.find(params[:housework_id])
  end

  def create
    @housework = Housework.find(params[:housework_id])
    @record = @housework.records.new(record_params)
    if @record.save
      redirect_to housework_records_path(@housework)
    else
      render :index
    end
  end

  private

  def record_params
    params.require(:record).permit(:content).merge(user_id: current_user.id)
  end
end
