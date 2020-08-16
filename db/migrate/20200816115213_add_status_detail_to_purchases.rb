class AddStatusDetailToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :status_detail, :string
  end
end
