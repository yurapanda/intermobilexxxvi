class AddPriceToServiceToDo < ActiveRecord::Migration
  def change
    add_column :service_todos, :price, :decimal
  end
end
