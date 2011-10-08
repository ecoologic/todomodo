
# functions that instantly affect the site
# ie: not event binding here (use userEvents)
window.users = 

  # behaviour of showing / hiding the current user note
  # show: boolean
  toggleCurrentUserNote: (show) -> 

    $form = $('#current_user_note')
    $link = $('#toggle_current_user_note')

    if show
      $form.slideDown()
      $link.html 'hide note'
    else
      $form.slideUp()
      $link.html 'show note'

    true


  # hide current user note (using toggleCurrentUserNote)
  hideCurrentUserNote: () ->
    users.toggleCurrentUserNote false
    true


  # show current user note (using toggleCurrentUserNote)
  showCurrentUserNote: () ->
    users.toggleCurrentUserNote true
    true


# init page ===================================================================
$ userInit = () ->

  # uploadAvatar
  $('#save_user').click( (e) ->
    $('#save_user').attr('disabled', 'disabled');
    $('#save_user_loading').slideDown()
    true # action will continue
  )




