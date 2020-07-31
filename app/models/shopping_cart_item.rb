class ShoppingCartItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product

  before_save :validates_quantity

  private

  def validates_quantity
    if self.quantity < 1
      self.errors.add(:quantity, "é menor que 0")
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end
end
