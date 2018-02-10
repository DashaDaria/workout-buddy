class User < ApplicationRecord
  has_secure_password
  has_many :workouts
  has_many :exercises, through: :workouts
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
        names_only = e_array.flatten
        names_only.max_by {|e| e_array.count(e)}
    else
      "no favorites yet!"
    end
  end
end
