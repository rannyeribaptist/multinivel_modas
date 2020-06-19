class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :address

  validates_presence_of :payment, :address_id, :user_id, :value
end
