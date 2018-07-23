class AddTimeToListTags < ActiveRecord::Migration[5.2]
  def change
    add_column :list_tags, :date, :integer
  end
end
