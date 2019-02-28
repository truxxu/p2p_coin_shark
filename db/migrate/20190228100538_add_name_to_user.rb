class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :id_type, :string
    add_column :users, :id_number, :integer
  end
end
