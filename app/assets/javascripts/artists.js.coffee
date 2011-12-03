

# init page ===================================================================
$ userInit = () ->

  # search artist
  $('#search_artist').click( (e) ->
    $('#search_artist').attr('disabled', 'disabled');
    $('#search_artist_loading').slideDown()
    true # action will continue
  )

