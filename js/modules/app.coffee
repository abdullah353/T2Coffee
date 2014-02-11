onDeviceReady=()->
     document.addEventListener "online", onOnline, false
onOnline = () ->
  $.couch.replicate Tangerine.config.address.local.dbName, Tangerine.config.address.cloud.host + "/" + Tangerine.config.address.cloud.dbName, 
    success: () ->
      true
    error: (a, b)->
      false

allResult = ''

gotFS = (fileSystem) ->
  fileSystem.root.getDirectory "data", create: true , gotDir

gotDir=(dirEntry) ->
    d = new Date();
    strDate = d.getFullYear() + "-" + d.getMonth()+1 +"-" + d.getDate() + "-" + Math.floor (Math.random() * 1000) + 1
    dirEntry.getFile "result" + strDate + ".json", 
      create: true
      exclusive: false, gotFile

gotFile=(fileEntry) ->
  fileEntry.createWriter gotFileWriter

gotFileWriter=(writer) ->
  writer.onwriteend = (evt)->
  writer.write JSON.stringify allResult

exchk = ->
  navigator.notification.confirm('Exit application ?', onConfirm, 'Warning!', 'Exit,Back' )

onConfirm = (button) ->
  if button is 1 then navigator.app.exitApp()