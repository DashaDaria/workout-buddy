class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :category_id
      t.integer :difficulty
      t.text :how
      t.integer :length

      t.timestamps
    end
  end
end
