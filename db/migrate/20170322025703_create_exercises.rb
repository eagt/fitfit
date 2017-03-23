class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.integer :user_id
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index("exercises", "user_id")
  end
end
