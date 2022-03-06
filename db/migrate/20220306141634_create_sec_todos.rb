class CreateSecTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :sec_todos do |t|
      t.string :title
      t.boolean :completed
      t.string :itemclass
      t.string :note
      t.references :todo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
