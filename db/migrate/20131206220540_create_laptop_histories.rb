class CreateLaptopHistories < ActiveRecord::Migration
  def change
    create_table :laptop_histories do |t|
      t.integer :laptop_id
      t.integer :transaction_id
    end
  end
end
