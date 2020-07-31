class AddUsersSalesVolumeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sales_volume, :string, default: "0,00"
  end
end
