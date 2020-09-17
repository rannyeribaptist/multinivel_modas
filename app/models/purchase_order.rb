class PurchaseOrder < ApplicationRecord
  belongs_to :product
  has_many :purchase_orders_items, dependent: :destroy

  accepts_nested_attributes_for :purchase_orders_items, reject_if: :all_blank, allow_destroy: false
end
