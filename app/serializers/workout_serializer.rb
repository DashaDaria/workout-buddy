class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :duration, :intensity
  has_many :exercises
end
