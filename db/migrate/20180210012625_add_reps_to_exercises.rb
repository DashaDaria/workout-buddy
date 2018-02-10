class AddRepsToExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises, :reps, :integer
  end
end
