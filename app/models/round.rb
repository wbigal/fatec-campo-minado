# == Schema Information
#
# Table name: rounds
#
#  id         :bigint(8)        not null, primary key
#  winner_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Round < ApplicationRecord
  belongs_to :winner, class_name: 'Player', optional: true

  has_many :items, class_name: 'RoundItem',
                   inverse_of: 'round',
                   dependent: :destroy
end
