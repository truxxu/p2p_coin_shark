class AddStatusToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :status, :string, default: "Pending"
  end
end
