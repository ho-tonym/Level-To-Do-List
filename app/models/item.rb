class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :tag

  validates :description, :presence => true

  def complete?
    self.status == 1
  end

  def incomplete?
    self.status == 0
  end
end
