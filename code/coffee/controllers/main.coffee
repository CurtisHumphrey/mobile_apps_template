main_vm = ->
  @title = ko.observable "Hello"   
  return
  
$(document).one 'app_init', (e, d) ->
  console.log "Loading Main VM"
  ko.applyBindings new main_vm()
  return