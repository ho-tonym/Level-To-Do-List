class AddDuckToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :duck, :string
  end
end
