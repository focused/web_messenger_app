$ ->
  $('#new_message_container').on 'keypress', 'textarea', (e) ->
    $(@).parents('form').submit() if e.ctrlKey && e.keyCode == 13

  $('#new_message_container').on 'keypress', 'textarea', ->
    $.ajax
      type: "GET",
      url: $('#typing_status').data('action-url'),
      success: (data) ->
        return false
      error: (data) ->
        return false


window.App ||= {
  typingTimer: null
}

App.currentUser = ->
  $('body').data('currentUser')

App.runTypingStatus = (author_id, author) ->
  return false if parseInt(author_id) == App.currentUser().id

  $('#typing_status strong').text(author)
  $('#typing_status .inner').show()

  clearTimeout(App.typingTimer) if App.typingTimer?
  App.typingTimer = setTimeout ->
      $('#typing_status .inner').hide()
    , 3000

