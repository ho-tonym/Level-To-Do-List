class Tag < ActiveRecord::Base
  has_many :list_tags
  has_many :lists, through: :list_tags

  validates :name, :presence => true, uniqueness: true
end
