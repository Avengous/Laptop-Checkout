class User < ActiveRecord::Base
  regex = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/
  validates :first_name,
            :presence => true,
            :uniqueness => { :case_sensitive => false }
  validates :last_name,
            :presence => true,
            :uniqueness => { :case_sensitive => false }
  validates_format_of :email,
            :multiline => true,
            :with => regex,
            :uniqueness => { :case_sensitive => false }
  def full_name
    "#{first_name} #{last_name}"
  end
end
