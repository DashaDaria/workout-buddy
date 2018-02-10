class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :status
  has_many :exercises
end
