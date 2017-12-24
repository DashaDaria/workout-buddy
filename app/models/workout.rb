class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  def exercises_attributes=(e_attributes)
    e_attributes.values.each do |e_attr|
      exercise = Exercise.find_or_create_by(e_attributes)
      self.workout_exercises.build(:exercise => exercise)
    end
  end

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

  def duration
    self.exercises.map {|e| e.length}.sum
  end

end
