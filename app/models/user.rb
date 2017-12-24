class User < ApplicationRecord
  has_secure_password
  has_many :workouts
  validates :name, presence: { message: "Please enter your name."}
  validates :email, presence: { message: "Email cannot be blank."}
  validates :email, uniqueness: { message: "This email has already been used."}
end
