@.uhloop = {}
uhloop.pusher = undefined

$ ->

  uhloop.pusher_key = $('#uhloop-content').data('pusher-key')
  flashvars = {}
  flashvars.ssut = $('#uhloop-content').data('ssut')
  flashvars.cint = $('#uhloop-content').data('cint')
  params = {}
  params.menu = "false"
  params.scale = "noScale"
  params.allowFullscreen = "true"
  params.allowScriptAccess = "always"
  params.bgcolor = "#090e0d"
  params.wmode = "direct"
  attributes = {}
  attributes.id = "uhloop"
  swfobject.embedSWF("uhloop.swf", "uhloop-content", "100%", "100%", "10.0.0", "express_install.swf", flashvars, params, attributes)

  receivedChatMessage = (num, x, y) ->
    getFlashObject("uhloop").receivedChatMessage(num, x, y)

  receivedCounter = (count) ->
    getFlashObject("uhloop").receivedCounter(count)

  getFlashObject = (swfName) ->
    unless navigator.appName.indexOf("Microsoft") is -1
      return window[swfName]
    else
      return document[swfName]

  uhloop.sendChatMessage = (num, x, y) ->
    socket_id = uhloop.pusher.connection.socket_id
    json = { "socket_id" : socket_id, "num" : num, "x" : x, "y" : y }
    str = JSON.stringify(json)
    $.ajax
      type: "POST"
      url: "/home/create"
      data: "message=" + str
      success: ->

  uhloop.sendCounter = (count) ->
    socket_id = uhloop.pusher.connection.socket_id
    json = { "socket_id" : socket_id, "count" : count }
    str = JSON.stringify(json)
    $.ajax
      type: "POST"
      url: "/home/create"
      data: "counter=" + str
      success: ->

  uhloop.connectUHLoop = ->
    uhloop.pusher  = new Pusher(uhloop.pusher_key)
    uhloop.pusher.connection.bind "connected", ->
      uhloop.sendCounter 1

    channel = uhloop.pusher.subscribe("channel")
    channel.bind "message-event", (json) ->
      try
        return if json.socket_id is uhloop.pusher.connection.socket_id
        return unless json.socket_id?
      catch e
        return
      receivedChatMessage json.num, json.x, json.y

    channel.bind "counter-event", (json) ->
      receivedCounter json.count
