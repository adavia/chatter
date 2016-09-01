class RoomsController < ApplicationController
  before_action :authorized_user, only: :show
  before_action :set_room, only: :show

  def index
    @rooms = Room.all.order(:created_at)
  end

  def show
    @messages = @room.messages.includes(:user).order(created_at: :desc).limit(15).reverse
    #@user = current_user.room_users.find_by(room_id: @room.id)
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
end
