class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :records_params, only: [:create, :destroy]


  def create
    Like.create(user_id: current_user.id, record_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, record_id: params[:id]).destroy
  end

  private

  def records_params
    @record = Record.find(params[:id])
  end
end