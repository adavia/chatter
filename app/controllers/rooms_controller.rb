class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order(:created_at)
  end

  def show

  end
end
