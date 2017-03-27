class CreateExercisesMuscles < ActiveRecord::Migration[5.0]

  def up
    create_table :exercises_muscles, :id => false do |t|
    	t.integer "exercise_id"
    	t.integer "muscle_id"
    end
    add_index("exercises_muscles",["exercise_id", "muscle_id"])
    
  end

  def down 
    drop_table :exercises_muscles
  end
end