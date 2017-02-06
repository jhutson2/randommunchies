class Ingredients < ActiveRecord::Migration[5.0]
  def change
    remove_column :ingredients, :recipe_reference, :string
    add_column :ingredients, :recipe_id, :integer
    remove_column :recipes, :instrucions, :string
    add_column :recipes, :instrucions, :string

  end
end
