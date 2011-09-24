# this file is for page js initialization only
# app and global constant are in utilities

$ initPage = () ->

  app.assignFunctions();

  app.showFlashMessages null

  $('input:first').focus()
  
  $("[rel^='prettyPhoto']").prettyPhoto()

  $('.datepicker').appDatepicker()

  $('.blink_once').appBlinkOnce()

  $('.tabs').tabs()





