# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.rooms.each do |room|
      stream_from "room:#{room.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    @room = Room.find(data["room_id"])
    @room.messages.create!(body: data["body"], user: current_user)
  end

  def send_status_message(data)
    @room = Room.find(data["room_id"])
    @room.messages.create!(body: data["body"], user: current_user)
  end
end
