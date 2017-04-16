class RemoveImageFieldsFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :image_file_name, :string
    remove_column :recipes, :image_content_type, :string
    remove_column :recipes, :image_file_size, :string
    remove_column :recipes, :image_updated_at, :datetime
  end
end
