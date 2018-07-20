class User < ActiveRecord::Base
  has_many :lists

  # has_many :items
  # has_many :lists, through: :items


  has_secure_password
  # validates :name, :password_digest, :presence => true
  validates :name, :password, :presence => true
end
