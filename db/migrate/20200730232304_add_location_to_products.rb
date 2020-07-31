class AddLocationToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :location, :string
  end
end
