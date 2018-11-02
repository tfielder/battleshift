require 'securerandom'

class User < ApplicationRecord

has_secure_password

def create_api_key
  self.api_key = SecureRandom.urlsafe_base64
end

def send_activation_email
   UserMailer.account_activation(self).deliver_now
end

def activate
   update_attribute(:activated,    true)
   update_attribute(:activated_at, Time.zone.now)
end

private

def create_identity_token
  self.identity_token = SecureRandom.urlsafe_base64
end

private
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

end
