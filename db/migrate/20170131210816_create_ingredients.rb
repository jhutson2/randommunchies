class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :meat
      t.string :vegetable
      t.string :seasoning
      t.string :grain
      t.string :fruit
      t.string :recipe_reference

      t.timestamps
    end
  end
end
