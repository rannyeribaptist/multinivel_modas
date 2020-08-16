class AddTypeToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :kind, :string
  end
end
