class CreateEquipmentExercises < ActiveRecord::Migration[5.0]
  
  def up
    create_table :equipment_exercises, :id => false do |t|
    	t.integer "exercise_id"
    	t.integer "equipment_id"
    end
    add_index("equipment_exercises",["exercise_id", "equipment_id"])
   end

  def down 
    drop_table :equipment_exercises
  end
end