class AssembleOrder < ApplicationRecord
  belongs_to :purchase
  belongs_to :user

  has_many :assemble_order_items, dependent: :destroy
  accepts_nested_attributes_for :assemble_order_items, reject_if: :all_blank, allow_destroy: false
end
