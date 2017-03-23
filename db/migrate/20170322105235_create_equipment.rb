class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      
      t.integer :user_id
      t.string :name

      t.timestamps
    end
    add_index("equipment", "user_id")
  end
end
