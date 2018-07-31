class ListSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name
  belongs_to :user
  has_many :items
end
