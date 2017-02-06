class IngredientsFix < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :instrucions, :string
    add_column :recipes, :instructions, :string
  end
end
