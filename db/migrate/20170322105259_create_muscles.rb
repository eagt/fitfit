class CreateMuscles < ActiveRecord::Migration[5.0]
  def change
    create_table :muscles do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
    add_index("muscles", "user_id")
  end
end
