class Order < ApplicationRecord
  has_many :order_items
  has_one :order_address

  accepts_nested_attributes_for :order_items, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :order_address, reject_if: :all_blank, allow_destroy: true
end
