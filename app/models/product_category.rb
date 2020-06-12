class ProductCategory < ApplicationRecord
  validates_presence_of :name, :icon

    mount_uploader :icon, AvatarUploader
end
