class CreateServiceTodos < ActiveRecord::Migration
  def change
    create_table :service_todos do |t|
      t.string :content
      t.references :cars_todo_list, index: true, foreign_key: true
      t.datetime :completed_at
      t.datetime :started_at
      t.datetime :paid_at

      t.timestamps null: false
    end
  end
end
