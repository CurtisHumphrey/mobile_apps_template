###
  @author Curtis M. Humphrey, Ph.D.
  
  This file generates and fires an event: 'app_init', after 
    everything has correctly "booted" e.g., PhoneGap, Dom, jQueryMobile
      
  Dependence (from global namespace):
    $   - jQuery
    infuser - infuser (part of ko templates)
    deviceready event - from PhoneGap
    mobile_system - from index.html file
    mobileinit event - from jQueryMobile
      
  Public API or Events:
    Fires 'app_init' event with {mobile: mobile_system}
###

device_ready = false
jqm_mobile_init = false
dom_ready = false
Check_App_Readiness = ->
  if jqm_mobile_init and dom_ready and (not mobile_system or device_ready)
    console.log "App Initializing"
        
    infuser.defaults.templateUrl = "ko_templates"
    # This are the defaults already
    #infuser.defaults.templatePrefix = "";
    #infuser.defaults.templateSuffix = ".html";
    
    $(document).trigger 'app_init', 
      mobile: mobile_system
  return
    
On_Device_Ready = ->
  device_ready = true
  console.log "Device Ready"
  Check_App_Readiness()

On_DOM_Ready = ->
  console.log "jQuery Ready"
  dom_ready = true
  Check_App_Readiness()

On_Mobile_Ready = ->
  console.log "Mobile jQuery Ready"
  
  $.support.cors = true
  $.mobile.allowCrossDomainPages = true
  jqm_mobile_init = true
  
  Check_App_Readiness()

#Listeners

$(document).ready -> On_DOM_Ready()
$(document).bind "mobileinit", On_Mobile_Ready  
document.addEventListener "deviceready", On_Device_Ready, false