# Place all the behaviours and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

window.users = 

  # TODO: test with jasmine
  currentUserNote: -> 

    # toggle the form (ubject)
    $('#toggle_current_user_note').click (e) ->
      $('#current_user_note').slideToggle()
    
    # toggle the link title (subject)
    $('#toggle_current_user_note').toggle(
      (e) -> $(this).html 'show note'
      (e) -> $(this).html 'hide note'
    )

    true
