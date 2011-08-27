# this file is for global variables and app function only

# global variables
window.HIDE_INFO_DELAY = 5000 #ms
window.SHORT_DELAY     = 2000 #ms
window.DATE_FORMAT     = 'dd/mm/yy'


# app functions
window.app =
  # TODO:
  # to avoid ie. errors (but I'm not going to mess my app more than this...)
  # log: (args) ->
  #   try console.log args
  #   catch

  # shows the flash messages
  # template == nil ? just go for the effects
  # useful in js templates
  # e.g.: app.show_flash_messages('<%= flash_messages %>');
  showFlashMessages: (template) ->
    
    $('#flash-messages').html template if template != null
  
    # show effects
    $('#flash-messages div').hide().
                             slideDown().
                             delay(HIDE_INFO_DELAY).
                             slideUp()
    $('#flash-messages')
