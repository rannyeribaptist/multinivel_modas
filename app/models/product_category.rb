class ProductCategory < ApplicationRecord
  validates_presence_of :name, :icon
  has_many :cats
  mount_uploader :icon, AvatarUploader
end
