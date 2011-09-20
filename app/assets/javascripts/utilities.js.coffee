# this file is for global variables and app function only

# global variables
window.HIDE_INFO_TIME = 5000       #ms
window.SHORT_TIME     = 2000       #ms
window.BLINK_TIME     = 500        #ms
window.DATE_FORMAT    = 'dd/mm/yy' # yy is already 4 digs.


# app functions
window.app =

  # shows the flash messages
  # template == nil ? just go for the effects
  # useful in js templates
  # e.g.: app.show_flash_messages('<%= flash_messages %>');
  showFlashMessages: (template) ->
    
    $('#flash_messages').html template if template != null
  
    # show effects
    $('#flash_messages div').hide().
                             slideDown().
                             delay(HIDE_INFO_TIME).
                             slideUp()
    true
  
  # assign behaviour to selectors
  # (use functions please)
  assignFunctions: ->


    true

  # to avoid ie errors (but I'm not going to mess my app more than this...)
  log: (args) -> try console.log args
