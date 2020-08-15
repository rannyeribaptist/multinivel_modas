class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_many :purchase_items, dependent: :destroy
  has_one :assemble, dependent: :destroy

  validates_presence_of :address_id, :user_id, :value, :payment_method

  mount_uploader :comprovant, ComprovantUploader
end
