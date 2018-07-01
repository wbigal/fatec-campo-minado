require 'rails_helper'

RSpec.describe Rounds::Create, type: :service do
  describe '#call' do
    context 'when there is not on game round' do
      it 'changes the total of Round' do
        expect { Rounds::Create.call }.to change(Round, :count).from(0).to(1)
      end

      it 'changes the total of RoundItem' do
        expect do
          Rounds::Create.call
        end.to change(RoundItem, :count).from(0).to(25)
      end

      it 'changes the total of flag' do
        expect { Rounds::Create.call }.to change {
          RoundItem.where(target_type: :flag).count
        }.from(0).to(1)
      end

      it 'changes the total of bombs' do
        expect { Rounds::Create.call }.to change {
          RoundItem.where(target_type: :bomb).count
        }.from(0).to(5)
      end

      it 'changes the total of nothing' do
        expect { Rounds::Create.call }.to change {
          RoundItem.where(target_type: :nothing).count
        }.from(0).to(19)
      end
    end

    context 'when there is on game round' do
      before { create(:round, :on_game) }

      it 'raises error Rounds::AlreadyRoundOnGame' do
        expect { Rounds::Create.call }.to raise_error(
          Rounds::AlreadyRoundOnGame
        )
      end
    end
  end
end
