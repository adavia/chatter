class MessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room:#{message.room.id}", {
      message: MessagesController.render(message),
      room_id: message.room.id
    }
  end
end
