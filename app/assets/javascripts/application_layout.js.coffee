HIDE_INFO_DELAY = 5000 #ms
SHORT_DELAY     = 2000 #ms

DATE_FORMAT     = 'dd/mm/yy'

$ initPage: ->

  $('input:first').focus()

  app.showFlashMessages null
  
  $("[rel^='prettyPhoto']").prettyPhoto()

  app.initDatepickers '.datepicker'

  $('.blink-once').hide().delay(SHORT_DELAY).slideDown().effect 'bounce', {}, 500



app =
  # to avoid ie. errors (but I'm not going to mess my app more than this...)
  # log: (args) ->
  #   try console.log args
  #   catch
    
  
  
  # shows the flash messages
  # template == nil ? just go for the effects
  # useful in js templates
  # e.g.: show_flash_messages('<%= flash_messages %>');
  showFlashMessages: (template) ->
  
    if template != null
      $('#flash-messages').html template
  
    # show effects
    $('#flash-messages div').hide().slideDown().
                             delay(HIDE_INFO_DELAY).
                             slideUp()
    $('#flash-messages')
  
  
  
  # add hasDatepicker to matching elements of selector
  # set DATE_FORMAT and animation
  initDatepickers: (selector) ->
    $(selector).datepicker().
                datepicker('option', 'dateFormat', DATE_FORMAT).
                datepicker({showOtherMonths: true, selectOtherMonths: true}).
                datepicker('option', 'showAnim', 'slideDown')
  

  