App.log = App.cable.subscriptions.create "LogChannel",
  connected: (data)->
    console.log("Connection is made");

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log("Recieving:")
    console.log(data.message)
