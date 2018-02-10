class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :how, :length, :reps, :category
end
