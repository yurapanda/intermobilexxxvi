json.array!(@cars_todo_lists) do |cars_todo_list|
  json.extract! cars_todo_list, :id, :car_plate_number, :car_model, :car_owner_email, :ready_for_pickup_at, :pickedup_at  json.url cars_todo_list_url(cars_todo_list, format: :json)

end
