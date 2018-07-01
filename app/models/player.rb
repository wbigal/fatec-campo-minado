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

class Player < ApplicationRecord
  has_many :wins, class_name: 'Round',
                  foreign_key: 'winner_id',
                  inverse_of: 'winner',
                  dependent: :destroy

  validates :session_id, presence: true,
                         length: { is: 32 },
                         uniqueness: { case_sensitive: false }

  validates :score, presence: true, numericality: { only_integer: true }
  validates :name, presence: true, length: { maximum: 15 }
end
