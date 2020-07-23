class AddApprovedToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :approved, :boolean, default: :false
  end
end
