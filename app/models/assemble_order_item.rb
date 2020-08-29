class AssembleOrderItem < ApplicationRecord
  belongs_to :purchase_item
  belongs_to :assemble_order  
end
