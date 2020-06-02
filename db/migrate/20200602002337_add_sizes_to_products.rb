class AddSizesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :sizes, :string, array: true, default: [].to_yaml
  end
end
