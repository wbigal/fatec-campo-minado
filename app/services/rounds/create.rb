module Rounds
  class AlredyRoundOnGame < StandardError; end

  class Create < ServiceBase
    def call
      Round.transaction do
        raise AlredyRoundOnGame if Round.on_game.any?
        create_round
      end
    end

    private

    def create_round
      new_round = Round.create!
      create_round_items(new_round)
    end

    def create_round_items(round)
      Round::TOTAL_ROWS.times do |row|
        create_round_items_columns(round: round, row: row)
      end
    end

    def create_round_items_columns(round:, row:)
      Round::TOTAL_COLUMNS.times do |column|
        round.items.create!(row: row,
                            column: column,
                            target_type: target_type(row, column))
      end
    end

    def target_type(row, column)
      target_types[(row * Round::TOTAL_COLUMNS) + column]
    end

    def target_types
      return @target_types if @target_types.present?
      total_elements = Round::TOTAL_ROWS * Round::TOTAL_COLUMNS
      elements = (0...total_elements).to_a
      @target_types = Array.new(total_elements, :nothing)
      @target_types[elements.delete(elements.sample)] = :flag
      5.times { @target_types[elements.delete(elements.sample)] = :bomb }
      @target_types
    end
  end
end
