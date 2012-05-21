# == Schema Information
#
# Table name: usuarios
#
#  id              :integer         not null, primary key
#  nombre          :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#

class Usuario < ActiveRecord::Base
  attr_accessible :nombre, :email, :password, :password_confirmation
  has_secure_password
  
  before_save { |usuario| usuario.email = email.downcase }
  before_save :create_remember_token
  
  validates :nombre,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
