class AddValueToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :value, :string
  end
end
