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

  send_action: (type, message) ->
    $.ajax
      url: @el.attr("href")
      type: type
      dataType: "JSON"
      success: (data, textStatus, jqXHR) =>
        App.rooms.send_user_action(@el.data("room-id"), message)
      complete: (jqXHR, textStatus) =>
        Turbolinks.clearCache()
        Turbolinks.visit(jqXHR.responseJSON.url, {"action":"replace"})

$(document).on "submit", "#new_message", (event) ->
  event.preventDefault()
  room = new Room @
  room.send_message()

$(document).on "click", "[data-behavior='room-join-link']", (event) ->
  event.preventDefault()
  room = new Room @
  room.send_action("POST", "has joined the room")

$(document).on "click", "[data-behavior='room-leave-link']", (event) ->
  event.preventDefault()
  room = new Room @
  room.send_action("DELETE", "has left the room")
