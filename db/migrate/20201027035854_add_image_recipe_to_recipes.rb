class AddImageRecipeToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :image_recipe, :string
  end
end
