class UserStarterPack < ApplicationRecord
  belongs_to :user
  belongs_to :starter_pack
end
