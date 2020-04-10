class Product < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :description, :price

  has_many :product_sizes, dependent: :destroy
  has_many :product_pictures, dependent: :destroy
  has_many :product_categories, dependent: :destroy

  accepts_nested_attributes_for :product_sizes, allow_destroy: :true, reject_if: :all_blank
  accepts_nested_attributes_for :product_pictures, allow_destroy: :true, reject_if: :all_blank
  accepts_nested_attributes_for :product_categories, allow_destroy: :true, reject_if: :all_blank

  validate :product_sizes_presence
  validate :product_pictures_presence
  validate :product_categories_presence

  def product_sizes_presence
    if not self.product_sizes.any?
      errors.add(:product_size, "O produto deve ter pelo menos um tamanho")
    end
  end

  def product_pictures_presence
    if not self.product_pictures.any?
      errors.add(:product_picture, "O produto deve ter pelo menos uma imagem")
    end
  end

  def product_categories_presence
    if not self.product_categories.any?
      errors.add(:product_category, "O produto deve ter pelo menos uma categoria")
    end
  end
end
