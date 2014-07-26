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
#  remember_token  :string(255)
#  admin           :boolean         default(FALSE)
#

class Usuario < ActiveRecord::Base
  attr_accessible :nombre, :email, :password, :password_confirmation
  has_secure_password
  has_many :tuits, dependent: :destroy
  has_many :relacions, foreign_key: "seguidor_id", dependent: :destroy
  has_many :usuarios_seguidos, through: :relacions, source: :seguido
  has_many :relacions_inversas, foreign_key: "seguido_id", class_name: "Relacion", dependent: :destroy
  has_many :usuarios_seguidores, through: :relacions_inversas, source: :seguidor
  
  before_save { |usuario| usuario.email = email.downcase }
  before_save :create_remember_token
  
  validates :nombre,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  def feed
    Tuit.de_los_usuarios_seguidos(self)
  end
  
  def siguiendo?(otro_usuario)
    relacions.find_by_seguido_id(otro_usuario.id)
  end

  def seguir!(otro_usuario)
    relacions.create!(seguido_id: otro_usuario.id)
  end
  
  def dejar_de_seguir!(otro_usuario)
    relacions.find_by_seguido_id(otro_usuario.id).destroy
  end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
