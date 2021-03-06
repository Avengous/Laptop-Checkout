class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :laptops_id
      t.integer :users_id
      t.boolean :checked_out
      t.timestamp :checked_out_time
      t.timestamp :checked_in_time
    end
  end
end
