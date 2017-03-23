json.extract! workout, :id, :user_id, :name, :date, :lifted_weight, :weight_unit, :repetitions, :created_at, :updated_at
json.url workout_url(workout, format: :json)
