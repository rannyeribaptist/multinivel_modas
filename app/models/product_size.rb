class ProductSize < ApplicationRecord
  belongs_to :product

  validates_presence_of :size
end
