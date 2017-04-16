class AddDragonflyImageToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :image_uid, :string
    add_column :recipes, :image_name, :string
  end
end
