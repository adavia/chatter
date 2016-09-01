$(document).on "turbolinks:load", ->
  room = $(".room-messages-wrapper")
  room.scrollTop(room.prop("scrollHeight"))
