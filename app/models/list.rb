class List < ActiveRecord::Base
  # belongs_to :user

  has_many :items
  # has_many :tags, through: :items

  validates :name, :presence => true
end
