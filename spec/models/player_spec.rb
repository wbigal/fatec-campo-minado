# == Schema Information
#
# Table name: players
#
#  id         :bigint(8)        not null, primary key
#  session_id :string(32)       not null
#  score      :integer          default(0), not null
#  name       :string(15)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Player, type: :model do
  it 'has a valid factory' do
    expect(create(:player)).to be_valid
  end

  describe '#wins' do
    it { is_expected.to have_many(:wins) }
  end

  describe '#session_id' do
    it { is_expected.to validate_presence_of(:session_id) }
    it { is_expected.to validate_length_of(:session_id).is_equal_to(32) }
    it do
      create(:player)
      is_expected.to validate_uniqueness_of(:session_id).case_insensitive
    end
  end

  describe '#score' do
    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_numericality_of(:score).only_integer }
  end

  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(15) }
  end
end
