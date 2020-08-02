class RemovePurchaseFromAssemble < ActiveRecord::Migration[6.0]
  def change
    remove_reference :assembles, :purchase, null: false, foreign_key: true
  end
end
