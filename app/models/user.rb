class User < ApplicationRecord
  has_secure_password
  has_many :workouts
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { message: "has already been used"}

  def favorite_exercise
    if !self.workouts.empty?
      e_array = self.workouts.all.map do |workout|
              workout.exercises.map do |e|
                e.name
              end
            end
            e_array.max_by {|e| e_array.count(e)}.join(", ")
    else
      "no favorites yet!"
    end
  end
end
