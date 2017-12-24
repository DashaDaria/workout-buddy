class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  def intensity
    level = self.exercises.map {|e| e.difficulty }.sum
    if level <= 3
      "easy"
    elsif level >= 9
      "hard"
    else
      "moderate"
    end
  end

end
