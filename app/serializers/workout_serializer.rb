class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :intensity, :duration

  has_many :exercises
end
