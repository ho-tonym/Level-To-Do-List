class ListTag < ActiveRecord::Base
  belongs_to :list
  belongs_to :tag

end
