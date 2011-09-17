# this file is for page initialization only

$ initPage = () ->

  app.assignFunctions();

  app.showFlashMessages null

  $('input:first').focus()
  
  $("[rel^='prettyPhoto']").prettyPhoto()

  $('.datepicker').appDatepicker()

  $('.blink_once').appBlinkOnce()

