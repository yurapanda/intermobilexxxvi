class RenameReadyForPickUp < ActiveRecord::Migration
  def change
  	rename_column :cars_todo_lists, :ready_for_pick_up_at, :ready_for_pickup_at
  end
end
