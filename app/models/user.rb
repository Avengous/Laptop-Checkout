class User < ActiveRecord::Base
  #belongs_to :user_history
  #attr_accessible :id, :first_name, :last_name
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
