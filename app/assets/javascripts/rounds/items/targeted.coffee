$(document).on 'click', '.field-area-button', ->
  $this = $(this)
  $parentTd = $this.parent()
  $minefield = $('#minefield')
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
      return
    error: ->
      $this.show()
      alert 'Jogada inválida'
      return
  return
