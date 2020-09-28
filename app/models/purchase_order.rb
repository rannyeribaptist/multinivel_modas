class PurchaseOrder < ApplicationRecord
  belongs_to :product
  has_many :purchase_orders_items, dependent: :destroy

  accepts_nested_attributes_for :purchase_orders_items, reject_if: :all_blank, allow_destroy: false

  def proccess_seller_balance
    user = User.find(self.product.user_id)

    current_balance = user.balance.to_f
    user.balance = current_balance + self.value.to_f
    user.save
  end
end
