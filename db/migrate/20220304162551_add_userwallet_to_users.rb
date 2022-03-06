class AddUserwalletToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :userwallet, :string
  end
end
