require 'rails_helper'

RSpec.describe RoundItems::Target, type: :service do
  describe '#call' do
    let(:round) { create(:round, :on_game) }
    let(:player) { create(:player) }

    let(:row) { 0 }
    let(:column) { 0 }
    let(:target_type) { :nothing }
    let(:targeted_by) { nil }

    let!(:round_item) do
      create(:round_item, round: round,
                          row: row,
                          column: column,
                          target_type: target_type,
                          targeted_by: targeted_by)
    end

    let(:round_id) { round.id }
    let(:player_id) { player.id }

    context 'when round items is targeted' do
      before do
        RoundItems::Target.call(
          round_id: round_id,
          player_id: player_id,
          row: row,
          column: column
        )
      end

      it do
        expect do
          round_item.reload
        end.to change(round_item, :targeted_by_id).from(nil).to(player_id)
      end

      it do
        expect { player.reload }.to change(player, :score).from(0).to(5)
      end
    end

    context 'when round items is targeted on the flag' do
      let(:target_type) { :flag }

      before do
        RoundItems::Target.call(
          round_id: round_id,
          player_id: player_id,
          row: row,
          column: column
        )
      end

      it do
        expect do
          round_item.reload
        end.to change(round_item, :targeted_by_id).from(nil).to(player_id)
      end

      it do
        expect { player.reload }.to change(player, :score).from(0).to(100)
      end

      it do
        expect do
          round.reload
        end.to change(round, :winner_id).from(nil).to(player_id)
      end
    end

    context 'when round items already targeted' do
      let(:targeted_by) { create(:player, session_id: SecureRandom.hex) }

      it do
        expect do
          RoundItems::Target.call(
            round_id: round_id,
            player_id: player_id,
            row: row,
            column: column
          )
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when round has winner' do
      let(:round) do
        create(:round, winner: create(:player, session_id: SecureRandom.hex))
      end

      it do
        expect do
          RoundItems::Target.call(
            round_id: round_id,
            player_id: player_id,
            row: row,
            column: column
          )
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
