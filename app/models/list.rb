class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :list_tags
  has_many :tags, through: :list_tags

  validates :name, :presence => true

  def self.my_users_items(userid)
    # binding.pry
    list = List.all.where(user_id: userid)
    #query Lists to find all the lists associated with user_id:3
    list.map do |list|
      list.items
    end
    #return all items associated with that user
  end
end
