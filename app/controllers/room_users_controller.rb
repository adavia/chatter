class RoomUsersController < ApplicationController
  before_action :authorized_user
  before_action :set_room
  before_action :check_user, only: :create

  def create
    @room_user = @room.room_users.where(user_id: current_user.id).first_or_create
    render json: { url: room_url(@room) }
  end

  def destroy
    @room_user = @room.room_users.where(user_id: current_user.id).destroy_all
    render json: { url: root_url }
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def check_user
    if current_user.rooms.include? @room
      redirect_to root_url, flash: { danger: "You are already logged in." }
    end
  end
end
