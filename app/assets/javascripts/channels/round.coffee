App.round = App.cable.subscriptions.create "RoundChannel",
  connected: ->
  disconnected: ->
  received: (data) ->
    $('#top-ten-players').load('/players/top_ten')
    $("#field-action-#{data.round_item.row}-#{data.round_item.column}").hide()
    $("#field-#{data.round_item.row}-#{data.round_item.column}").addClass('target-'+ data.round_item.target_type)

    if (data.round_item.winner_id)
      $('#next-game').removeClass('d-none')
      $('.field-area-button').hide()
