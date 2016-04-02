class CreateCarsTodoLists < ActiveRecord::Migration
  def change
    create_table :cars_todo_lists do |t|
      t.string :car_plate_number
      t.string :car_owner_email
      t.datetime :pickedup_at
      t.datetime :ready_for_pick_up_at

      t.timestamps null: false
    end
  end
end
