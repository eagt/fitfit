class CreateMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :measurements do |t|
      t.string :user_id
      t.date :date
      t.string :weight
      t.string :weight_unit
      t.string :fat_pct

      t.timestamps
    end
    add_index("measurements", "user_id")
  end
end
