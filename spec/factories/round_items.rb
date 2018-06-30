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

FactoryBot.define do
  factory :round_item do
    round
    row 0
    column 0
    target_type :nothing
  end
end
