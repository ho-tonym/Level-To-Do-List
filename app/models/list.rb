class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :list_tags
  has_many :tags, through: :list_tags

  validates :name, :presence => true

  def self.my_users_items(userid)
    list = List.all.where(user_id: userid)
    list.map do |list|
      list.items
    end
  end
end
