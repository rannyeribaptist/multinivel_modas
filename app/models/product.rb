class Product < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :description, :price

  has_many :product_pictures, dependent: :destroy
  has_many :cats, dependent: :destroy
  accepts_nested_attributes_for :product_pictures, allow_destroy: :true, reject_if: :all_blank

  validate :product_pictures_presence

  serialize :categories, Array
  serialize :sizes, Array

  before_save :clean_product_value
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

  private

  def clean_product_value
    self.price = self.price.gsub(".", "").gsub(",", ".").to_f
  end

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
