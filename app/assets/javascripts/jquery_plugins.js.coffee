# this file is for jquery plugins only

$.fn.extend
  # add hasDatepicker to matching elements of selector
  # set DATE_FORMAT and animation
  appDatepicker: ->
    this.datepicker().
         datepicker('option', 'dateFormat', DATE_FORMAT).
         datepicker({showOtherMonths: true, selectOtherMonths: true}).
         datepicker('option', 'showAnim', 'slideDown')

  # short and small animation
  # eg: app.blinkOnce('.blink-once');
  appBlinkOnce: ->
    this.hide().
         delay(SHORT_TIME).
         slideDown().
         effect('bounce', {}, 'slow')





