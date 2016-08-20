# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Room
  constructor: (el) ->
    @el = $(el)
    @room_id = $("[data-behavior='room-messages']").data("room-id")
    @body = @el.find("#message_body")

  send_message: ->
    if $.trim(@body.val()) != ""
      App.rooms.send_message(@room_id, @body.val())
      @body.val("")
    else
      alert("Cannot send empty messages!")

$(document).on "submit", "#new_message", (event) ->
  event.preventDefault()
  room = new Room @
  room.send_message()
