class User < ApplicationRecord
attr_accessor :activation_token
before_create :create_activation_digest

validates :name, presence: true
validates :email, uniqueness: true, presence: true
validates_presence_of :password, require: true

has_secure_password

private
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
