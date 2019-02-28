class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.date :loan_start
      t.date :loan_end

      t.timestamps
    end
  end
end
