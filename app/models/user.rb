class User < ApplicationRecord
  validates_presence_of :id, :name, :email
end
