$(document).on "turbolinks:load", ->
  roomContainer = $(".room-messages-wrapper")
  roomContainer.scrollTop(roomContainer.prop("scrollHeight"))
