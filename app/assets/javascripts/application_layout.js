HIDE_INFO_DELAY = 5000//ms
SHORT_DELAY     = 1000//ms


$(function(){

  $('#flash-messages').delay(HIDE_INFO_DELAY).slideUp();

  $('.blink-once').delay(SHORT_DELAY).fadeIn();
  
  $('.datepicker').datepicker();

});