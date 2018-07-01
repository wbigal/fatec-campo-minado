$(document).on 'click', '.field-area-button', ->
  $this = $(this)
  $parentTd = $this.parent()
  $minefield = $('#minefield')
  $playerMessage = $('#player-mesages')
  roundId = $minefield.data('round-id')
  row = $parentTd.data('row')
  column = $parentTd.data('column')

  $.ajax
    type: 'POST'
    contentType: 'application/json'
    url: '/rounds/' + roundId + '/items/targeted'
    data: JSON.stringify(rounds_items_targeted_form: row: row, column: column)
    beforeSend: ->
      $this.hide()
      return
    success: (data) ->
      $('#player-score').html data.player_score
      $parentTd.addClass('target-'+ data.target_type)
      if (data.winner_id)
        $('#next-game').removeClass('d-none')
        $('.field-area-button').hide()
      return
    complete: (data) ->
      if (data.status == 201)
        roundItem = data.responseJSON
        $parentTd.addClass('my-field-area')
        if (roundItem.target_type == 'nothing')
          $playerMessage.text('Você descobriu uma área vazia.')
        else if (roundItem.target_type == 'bomb')
          $playerMessage.text('Não! Você pisou em uma mina!')
        else if (roundItem.target_type == 'flag')
          $playerMessage.text('Você encontrou a bandeira \\o/')
      return
    error: (data, status) ->
      if (data.status == 404)
        $playerMessage.text('Parece que alguém chegou primeiro. Esta área do campo não está mais disponivel.');
      else
        $this.show()
      return
  return
