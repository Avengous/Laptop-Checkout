class Laptop < ActiveRecord::Base
  validates :scan_code,
            :presence => true,
            :uniqueness => { :case_sensitive => true }
  validates :item_name,
            :presence => true,
            :uniqueness => { :case_sensitive => false }
end
