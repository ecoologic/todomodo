# describe application_layout only

# app functions
window.applicationLayout =

  # shows the flash messages
  # template == nil ? just go for the effects
  # useful in js templates
  # eg: app.show_flash_messages('<%= flash_messages %>');
  showFlashMessages: (template = null) ->

    # the message
    $('#flash_messages').html template if template != null
  
    # show effects
    $('#flash_messages div').hide().
                             slideDown().
                             delay(HIDE_INFO_TIME).
                             slideUp()
    true
  



# init page ===================================================================
$ applicationLayoutInit = () ->

  applicationLayout.showFlashMessages()



