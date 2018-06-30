# == Schema Information
#
# Table name: rounds
#
#  id         :bigint(8)        not null, primary key
#  winner_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Round, type: :model do
  it 'has a valid factory' do
    expect(create(:round)).to be_valid
  end

  describe '#items' do
    it { is_expected.to have_many(:items) }
  end

  describe '#winner' do
    it { is_expected.to belong_to(:winner) }
  end
end
