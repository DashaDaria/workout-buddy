class User < ApplicationRecord
  has_secure_password
  has_many :workouts
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { message: "This email has already been used."}
end
