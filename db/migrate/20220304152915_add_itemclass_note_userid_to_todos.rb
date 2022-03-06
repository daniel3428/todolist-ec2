class AddItemclassNoteUseridToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :itemclass, :string
    add_column :todos, :note, :string
    add_column :todos, :user_id, :string
  end
end
