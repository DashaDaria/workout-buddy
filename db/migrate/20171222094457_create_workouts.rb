class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.boolean :completed, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
