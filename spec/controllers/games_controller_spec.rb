require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'GET index' do
    context 'when there is round' do
      let!(:round) { create(:round, :on_game) }

      before do
        process :index, method: :get
      end

      it { expect(response).to render_template('index') }
      it { expect(assigns(:round)).to eq(round) }
    end

    context 'when there are not matches' do
      before do
        process :index, method: :get
      end

      it { expect(response).to render_template('index') }
      it { expect(assigns(:round)).to be_blank }
    end
  end
end
