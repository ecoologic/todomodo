HIDE_INFO_DELAY = 5000;//ms
SHORT_DELAY     = 2000;//ms

DATE_FORMAT     = 'dd/mm/yy';

$(function initApp(){

  $('#flash-messages div').delay(HIDE_INFO_DELAY).slideUp();

  $('.blink-once').hide().delay(SHORT_DELAY).slideDown().effect('bounce', {}, 500);
  
  $('.datepicker').datepicker();
  
  $('[rel^="prettyPhoto"]').prettyPhoto();
  
  $('input:first').focus();

});

