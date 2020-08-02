class AddReferenceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :referece, :string
  end
end
