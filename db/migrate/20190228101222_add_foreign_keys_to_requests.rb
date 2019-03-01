class AddForeignKeysToRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :requests, :user, foreign_key: true
    add_reference :requests, :loan, foreign_key: true
    add_column :requests, :requested_amount, :integer
  end
end
