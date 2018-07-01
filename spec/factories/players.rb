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

FactoryBot.define do
  factory :player do
    name Faker::Cat.unique.name
    session_id SecureRandom.hex
  end
end
