class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises
  validates :name, presence: true

  def exercises_attributes=(e_hashes)
      e_hashes.values.each do |e_attributes|
        exercise = Exercise.find_or_create_by(e_attributes)
        self.exercises << exercise
      end
    end

  scope :done, -> {where(completed: true)}
  scope :not_done, -> {where(completed: false)}


  def status
    self.completed ? "completed" : "not completed"
  end

  def intensity
    level = self.exercises.map {|e| e.level }.sum
    if level <= 3
      "easy"
    elsif level >= 9
      "hard"
    else
      "moderate"
    end
  end

  def duration
    self.exercises.map {|e| e.length * e.reps}.sum
  end
end
