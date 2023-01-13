class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :record_params, only: [:create, :destroy]
  def create
    Like.create(user_id: current_user.id, record_id: @record.id)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, record_id: @record.id)
    like.destroy
  end

  private
  def record_params
    @record = Record.find(params[:record_id])
  end
end
