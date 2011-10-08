# All the bindings that are valid for every controller

# init page ===================================================================
$ appInit = () ->

  $('input:first').focus()
  
  $("[rel^='prettyPhoto']").prettyPhoto()

  $('.datepicker').appDatepicker()

  $('.blink_once').appBlinkOnce()

  $('.tabs').tabs()





