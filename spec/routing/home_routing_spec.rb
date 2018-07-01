require 'rails_helper'

RSpec.describe GamesController, type: :routing do
  describe '#index' do
    it { expect(get: '/').to route_to('games#index') }
  end
end
