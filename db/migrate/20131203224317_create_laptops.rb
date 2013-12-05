class CreateLaptops < ActiveRecord::Migration
  def change
    create_table :laptops do |t|
      t.string :scan_code
      t.string :item_name
      t.boolean :available, :default => true
    end
  end
end
