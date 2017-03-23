json.extract! measurement, :id, :user_id, :date, :weight, :weight_unit, :fat_pct, :created_at, :updated_at
json.url measurement_url(measurement, format: :json)
