class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end