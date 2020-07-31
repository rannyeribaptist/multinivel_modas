class UrlMinifier < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :number
  validates_presence_of :number, :user_id, :code
end
