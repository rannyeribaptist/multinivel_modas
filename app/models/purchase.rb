class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_many :purchase_items, dependent: :destroy

  validates_presence_of :address_id, :user_id, :value, :payment_method

  mount_uploader :comprovant, ComprovantUploader

  def create_assemble_order
    assemble = AssembleOrder.new(purchase_id: self.id, status: "Pendente montagem")
    assemble.user_id = AssemblersList.first.set_assembler()

    assemble.save

    self.purchase_items.each do |item|
      assemble.assemble_order_items.create(purchase_item: item, :status => "Em estoque")
    end
  end

  def create_purchase_order
    self.purchase_items.each do |item|
      PurchaseOrder.create(product_id: item.product_id, :quantity => item.quantity, status: "Nova Ordem de compra", size: item.size)
    end
  end
end
