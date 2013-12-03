class CreateLaptops < ActiveRecord::Migration
  def change
    create_table :laptops do |t|
      t.string :ScanCode
      t.string :ItemName

      t.timestamps
    end
  end
end
