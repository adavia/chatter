class RoomsController < ApplicationController
  before_action :authorized_user, only: :show

  def index
    @rooms = Room.all.order(:created_at)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user).order(created_at: :desc).limit(15).reverse
  end
end
