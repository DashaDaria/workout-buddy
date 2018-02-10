class Exercise < ApplicationRecord
  belongs_to :workout
  validates :level, length: { in: 1..3 }
end
