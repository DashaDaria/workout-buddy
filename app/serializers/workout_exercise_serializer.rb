class WorkoutExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty, :how, :length, :reps, :category

  def category
    object.exercise.category.name
  end
end
