module RoundItems
  class Target < ServiceBase
    attr_reader :round_id
    attr_reader :player_id
    attr_reader :row
    attr_reader :column

    def initialize(round_id:, player_id:, row:, column:)
      @round_id = round_id
      @player_id = player_id
      @row = row
      @column = column
    end

    def call
      RoundItem.transaction do
        update_round_item
        update_player_score
        set_winner_of_round
        targeted_item
      end
    end

    private

    def update_round_item
      round_item.update(targeted_by: player)
      round_item.target_type
    end

    def update_player_score
      current_score = player.score
      target_points = TargetPoints.point_of(round_item.target_type)
      player.update(score: current_score + target_points)
    end

    def set_winner_of_round
      return false if round.winner?
      return false unless round_item.flag?
      round.update(winner: player)
    end

    def targeted_item
      Hash[
        winner_id: round.winner_id,
        player_score: player.score,
        targeted_by_id: player.id,
        target_type: round_item.target_type,
        row: @row,
        column: @column
      ]
    end

    def player
      @player ||= Player.find(@player_id)
    end

    def round
      @round ||= Round.on_game.find(@round_id)
    end

    def round_item
      @round_item ||= round.items.available.find_by!(row: @row, column: @column)
    end
  end
end
