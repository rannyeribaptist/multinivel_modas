class ProductPicture < ApplicationRecord
  belongs_to :product
  validates_presence_of :picture
  mount_uploader :picture, AvatarUploader
end
