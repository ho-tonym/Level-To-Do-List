class List < ActiveRecord::Base
  has_many :items
  has_many :tags through: :items

  validates :name, :presence => true
end
