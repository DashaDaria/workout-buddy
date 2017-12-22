class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :status, default: "not completed"
      t.integer :user_id

      t.timestamps
    end
  end
end
