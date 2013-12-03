class Laptops < ActiveRecord::Base
  validates :ScanCode, presence: true
  validates :ItemName, presence: true
end
