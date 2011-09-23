# Place all the behaviours and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

# user functions
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
    users.toggleCurrentUserNote(false)
    true

  # show current user note (using toggleCurrentUserNote)
  showCurrentUserNote: () ->
    users.toggleCurrentUserNote(true)
    true
