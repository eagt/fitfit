class CreateEtypesExerxises < ActiveRecord::Migration[5.0]

  def up
    create_table :etypes_exercises, :id => false do |t|
    	t.integer "exercise_id"
    	t.integer "etype_id"
    end
    add_index("etypes_exercises",["exercise_id", "etype_id"])
  end

  def down 
    drop_table :etypes_exercises
  end
end
