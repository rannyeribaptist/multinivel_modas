class Size < ApplicationRecord
  belongs_to :product

  validates_presence_of :name, :quantity
end
