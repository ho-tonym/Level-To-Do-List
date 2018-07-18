class Item < ActiveRecord::Base
  belongs_to :list
  has_many :users :through :lists

  # belongs_to :user
  validates :description, :presence => true

  def complete?
    self.status == 1
  end

  def incomplete?
    self.status == 0
  end
end
