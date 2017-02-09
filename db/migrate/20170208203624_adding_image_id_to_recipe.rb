class AddingImageIdToRecipe < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :image, :string
    add_column :recipes, :recipe_image_id, :string
  end
end
