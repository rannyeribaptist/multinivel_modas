class AddStatusToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :status, :string
    add_column :purchases, :comprovant, :string
  end
end
