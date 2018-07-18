class List < ActiveRecord::Base
  has_many :items
  belongs_to :user
  # belongs_to :tag

  # has_many :tags
  validates :name, :presence => true
end
