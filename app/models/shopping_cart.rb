class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_cart_items

  accepts_nested_attributes_for :shopping_cart_items, reject_if: :all_blank
end
