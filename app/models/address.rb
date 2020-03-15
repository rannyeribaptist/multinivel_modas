class Address < ApplicationRecord
  belongs_to :user

  validates_presence_of :street
  validates_presence_of :neightbohood
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :number
  validates_presence_of :cep
end
