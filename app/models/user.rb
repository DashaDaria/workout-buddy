class User < ApplicationRecord
  has_secure_password
  has_many :workouts
  has_many :exercises, through: :workouts
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { message: "has already been used"}

  def most_exercises
    if !self.workouts.empty?
      w_array = self.workouts.map { |w| w.exercises.count}
      
    else
      "no workouts yet!"
    end
  end
end
