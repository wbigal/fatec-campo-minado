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

class RoundItem < ApplicationRecord
  belongs_to :round
  belongs_to :targeted_by, class_name: 'Player', optional: true

  enum target_type: %i[nothing bomb flag]

  validates :target_type, presence: true

  validates :row, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than: 5
  }

  validates :column, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than: 5
  }

  scope :available, -> { where(targeted_by_id: nil) }
  scope :targeted, -> { where.not(targeted_by_id: nil) }
end
