class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty, :how, :length
end
