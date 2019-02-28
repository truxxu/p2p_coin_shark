class AddForeignKeyToLoans < ActiveRecord::Migration[5.2]
  def change
    add_reference :loans, :user, foreign_key: true
    add_column :loans, :min_amount, :integer
    add_column :loans, :max_amount, :integer
    add_column :loans, :interest_rate, :integer
    add_column :loans, :payment_frequency, :string
    add_column :loans, :payment_period, :string
  end
end
