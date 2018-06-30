# == Schema Information
#
# Table name: rounds
#
#  id         :bigint(8)        not null, primary key
#  winner_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :round do
  end
end
