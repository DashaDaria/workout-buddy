class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty, :how, :length
  belongs_to :category
end
