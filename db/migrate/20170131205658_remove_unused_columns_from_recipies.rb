class RemoveUnusedColumnsFromRecipies < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :protein, :string
    remove_column :recipes, :vegetables, :string
    remove_column :recipes, :seaoning, :string
  end
end
