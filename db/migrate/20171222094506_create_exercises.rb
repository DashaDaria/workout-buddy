class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :category
      t.integer :level
      t.text :how
      t.integer :length
      t.integer :workout_id

      t.timestamps
    end
  end
end
