App.rooms = App.cable.subscriptions.create "RoomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    room = $("[data-behavior='room-messages'][data-room-id='#{data.room_id}']")
    if room.length > 0
      room.append(data.message)
      room.scrollTop(room.prop("scrollHeight"))
    else
      $("[data-behavior='room-link'][data-room-id='#{data.room_id}']").css("font-weight", "bold")

  send_message: (room_id, message) ->
    @perform "send_message", {room_id: room_id, body: message}

  send_user_action: (room_id, message) ->
    @perform "send_status_message", {room_id: room_id, body: message}
