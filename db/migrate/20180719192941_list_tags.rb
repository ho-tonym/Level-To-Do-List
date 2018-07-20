class ListTags < ActiveRecord::Migration[5.2]
  def change
    create_table :list_tags do |t|
      t.integer :tag_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
