class Assemble < ApplicationRecord
  belongs_to :purchase
  belongs_to :user
end