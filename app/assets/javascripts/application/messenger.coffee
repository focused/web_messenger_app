$ ->
  $('#new_message_container form').on 'keypress', 'textarea', ->
    $.ajax
      type: "GET",
      url: $('#typing_status').data('action-url'),
      success: (data) ->
        return false
      error: (data) ->
        return false

typingTimer = null

window.App ||=
  runTypingStatus: (author) ->
    $('#typing_status strong').text(author)
    $('#typing_status .inner').show()
    clearTimeout(typingTimer) if typingTimer?
    typingTimer = setTimeout ->
        $('#typing_status .inner').hide()
      , 3000

