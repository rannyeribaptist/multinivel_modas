class Product < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :description, :original_price

  has_many :product_pictures, dependent: :destroy
  has_many :cats, dependent: :destroy
  has_many :sizes, dependent: :destroy
  accepts_nested_attributes_for :product_pictures, allow_destroy: :true, reject_if: :all_blank
  accepts_nested_attributes_for :sizes, allow_destroy: :true, reject_if: :all_blank

  validate :product_pictures_presence
  validate :sizes_presence

  validates_uniqueness_of :location

  serialize :categories, Array

  # after_save :set_product_value

  self.per_page = 10

  filterrific(
    default_filter_params: { sorted_by: "created_at_desc" },
    available_filters: [
      :sorted_by,
      :with_category_id
    ],
  )

  scope :with_category_id, lambda { |query|
    Product.joins(:cats).where('product_category_id = ?', "#{query}")
  }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'

    case sort_option.to_s
    when /^created_at/
      order("LOWER(products.created_at) #{ direction }")
    else
      raise(ArgumentError, "Opção inválida: #{ sort_option.inspect }")
    end
  }

  def self.options_for_sorted_by
    [
      ['Data de Registro (novos primeiro)', 'created_at_desc'],
      ['Data de Registro (antigos primeiro)', 'created_at_asc']
    ]
  end

  def calculate_stock
    total = 0

    self.sizes.each do |size|
      total += size.quantity
    end

    return total
  end

  private

  def product_pictures_presence
    if not self.product_pictures.any?
      errors.add(:product_picture, "O produto deve ter pelo menos uma imagem")
    end
  end

  def sizes_presence
    if not self.sizes.any?
      errors.add(:sizes, "O produto deve ter pelo menos um tamanho")
    end
  end

  def set_product_value
    if not (self.original_price.to_f * 1.90 == self.price.to_f)
      self.price = (self.original_price.to_f * 1.90).to_s
      self.save
    end
  end
end
