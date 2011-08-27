# this file is for page initialization only

$ initPage = () ->

  $('input:first').focus()

  app.showFlashMessages null
  
  $("[rel^='prettyPhoto']").prettyPhoto()

  # app.initDatepickers '.datepicker'
  $('.datepicker').appDatepicker()

  $('.blink-once').appBlinkOnce()
