class Exercise < ApplicationRecord
  belongs_to :category
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
  validates :difficulty, length: { in: 1..3 }
end
