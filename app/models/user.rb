class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save :create_remember_token
  has_secure_password
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
