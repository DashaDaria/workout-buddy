class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

delegate :name, :category, :how, :length, :difficulty, to: :exercise
end
