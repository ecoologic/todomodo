# this file is for page js initialization and constants only

# global variables
window.HIDE_INFO_TIME = 3000       #ms
window.SHORT_TIME     = 2000       #ms
window.BLINK_TIME     = 500        #ms
window.DATE_FORMAT    = 'dd/mm/yy' # yy is already 4 digs.


# assign events to selectors
window.jQueryEvents = () -> 

  $('input:first').focus()
  
  $("[rel^='prettyPhoto']").prettyPhoto()

  $('.datepicker').appDatepicker()

  $('.blink_once').appBlinkOnce()

  $('.tabs').tabs()

  true


# initialize the page
$ initPage = () ->

  jQueryEvents()
  applicationLayoutEvents()
  userEvents();



# to avoid ie errors (but I'm not going to mess my app more than this...)
window.log = (args) -> try console.log args



