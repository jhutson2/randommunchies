class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :protein
      t.string :vegetables
      t.string :seaoning
      t.text :instrucions

      t.timestamps
    end
  end
end
