class AddImageUserToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_user, :string
  end
end
