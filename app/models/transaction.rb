class Transaction < ActiveRecord::Base
  validates :laptops_id,
            :presence => true
  validates :users_id,
            :presence => true
end
