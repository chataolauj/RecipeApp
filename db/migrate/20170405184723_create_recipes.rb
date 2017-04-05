class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :author
      t.integer :servings
      t.integer :prep_time
      t.integer :cook_time
      t.string :recipe_name
      t.text :description
      t.text :ingredients
      t.text :directions

      t.timestamps
    end
  end
end
