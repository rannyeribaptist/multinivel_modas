class ProductPicture < ApplicationRecord
  belongs_to :product

  validates_presence_of :picture
end
