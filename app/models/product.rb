class Product < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :description, :price

  has_many :product_pictures, dependent: :destroy
  accepts_nested_attributes_for :product_pictures, allow_destroy: :true, reject_if: :all_blank

  validate :product_pictures_presence

  serialize :categories, Array
  serialize :sizes, Array

  after_save :set_product_value

  private

  def product_pictures_presence
    if not self.product_pictures.any?
      errors.add(:product_picture, "O produto deve ter pelo menos uma imagem")
    end
  end

  def set_product_value
    self.price = "R$ " + (self.price[2..self.price.length].to_i * 1.7).to_s
    self.save
  end
end
