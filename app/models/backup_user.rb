class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :FirstName, presence: true
  validates :LastName, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :Email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
