class User < ApplicationRecord
attr_accessor :activation_token
before_create :create_activation_digest
before_save :downcase_email

validates :name, presence: true
validates :email, uniqueness: true, presence: true
validates_presence_of :password, require: true

has_secure_password

def User.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end

def User.new_token
  SecureRandom.urlsafe_base64
end

def authenticated?(token)
  digest = send("activation_digest")
  return false if digest.nil?
  BCrypt::Password.new(digest).is_password?(token)
end

private
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def downcase_email
    email.downcase!
  end
end
