class User < ActiveRecord::Base
  # has_many :lists
  has_secure_password
  validates :name, :password_digest, :presence => true
end
