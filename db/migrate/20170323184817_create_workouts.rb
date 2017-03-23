class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.string :user_id
      t.string :name
      t.date :date
      t.string :lifted_weight
      t.string :weight_unit
      t.string :repetitions

      t.timestamps
    end
    add_index("workouts", "user_id")
  end
end
