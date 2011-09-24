# Place all the behaviours and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

# user functions
window.users = 


  # events ====================================================================
  # called in above section

  # hide current user note after save button is pressed
  hideCurrentUserNoteAfterSave: () ->
    $('#save_current_user_note').click(
      users.hideCurrentUserNote
    )
    true

  uploadAvatar: () -> 
    $('#save_user').click( (e) ->
      $('#save_user').attr('disabled', 'disabled');
      $('#save_user_loading').slideDown()
      true # action will continue
    )
    true


  # functions =================================================================
  # group functions that instantly affect the site

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


# assign events to selectors
# NOTE: just call functions please
# implement them in window.users events section
window.userEvents = () -> 

    users.hideCurrentUserNoteAfterSave()

    users.uploadAvatar()

    true


