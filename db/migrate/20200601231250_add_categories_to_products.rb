class AddCategoriesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :categories, :string, array: true, default: [].to_yaml
  end
end
