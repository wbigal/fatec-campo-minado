require 'rails_helper'

RSpec.describe Rounds::Items::TargetedController, type: :routing do
  describe '#create' do
    it do
      expect(post: '/rounds/1/items/targeted').to route_to(
        'rounds/items/targeted#create',
        round_id: '1'
      )
    end
  end
end
