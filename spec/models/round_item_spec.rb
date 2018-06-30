# == Schema Information
#
# Table name: round_items
#
#  id             :bigint(8)        not null, primary key
#  round_id       :bigint(8)
#  row            :integer          not null
#  column         :integer          not null
#  target_type    :integer          not null
#  targeted_by_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe RoundItem, type: :model do
  it 'has a valid factory' do
    expect(create(:round_item)).to be_valid
  end

  describe '#round' do
    it { is_expected.to belong_to(:round) }
  end

  describe '#targeted_by' do
    it { is_expected.to belong_to(:targeted_by) }
  end

  describe '#target_type' do
    it { is_expected.to validate_presence_of(:target_type) }
    it { should define_enum_for(:target_type) }
  end

  describe '#row' do
    it { is_expected.to validate_presence_of(:row) }

    it do
      is_expected.to validate_numericality_of(:row).
        only_integer.is_greater_than_or_equal_to(0).
        is_less_than(5)
    end
  end

  describe '#column' do
    it { is_expected.to validate_presence_of(:column) }

    it do
      is_expected.to validate_numericality_of(:column).
        only_integer.is_greater_than_or_equal_to(0).
        is_less_than(5)
    end
  end
end
