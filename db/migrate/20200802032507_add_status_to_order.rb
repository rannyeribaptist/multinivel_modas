class AddStatusToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :status, :string
    add_column :orders, :data_converted, :text
  end
end
