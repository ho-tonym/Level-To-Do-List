class User < ActiveRecord::Base
  has_many :lists

  # has_many :items
  # has_many :lists, through: :items

  has_secure_password
  # validates :name, :password_digest, :presence => true
  validates :name, :password, :presence => true

  def self.find_or_create_by_omniauth(auth_hash)
    # oauth_email = auth_hash["info"]["email"]
    oauth_nickname = auth_hash["info"]["nickname"]
    self.where(:name => oauth_nickname).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:name => auth_hash["info"]["nickname"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end
end
