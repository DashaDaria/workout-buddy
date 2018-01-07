class Exercise < ApplicationRecord
  belongs_to :category
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
  validates :difficulty, length: { in: 1..3 }

  def reps_for(workout_id)
    workout_exercises.where(workout_id: workout_id).first.reps
  end
end
