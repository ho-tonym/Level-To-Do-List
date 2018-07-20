class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :list_tags
  has_many :tags, through: :list_tags

  # has_many :list_tags
  # has_many :tags, through: :list_tags
  # has_many :items
  # has_many :users, through: :items

  validates :name, :presence => true
end
