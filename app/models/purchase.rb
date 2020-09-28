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
      purchase_order = PurchaseOrder.where(product_id: item.product_id).last

      if purchase_order.present? and purchase_order.status.downcase == "nova ordem de compra"
        purchase_item = purchase_order.purchase_orders_items.where(size: item.size).first

        if purchase_item.present?
          purchase_item.update_attribute(:quantity, purchase_item.quantity.to_i + item.quantity.to_i)
        else
          purchase_order.purchase_orders_items.create(size: item.size, quantity: item.quantity)
        end
      else
        purchase_order = PurchaseOrder.create(product_id: item.product_id, status: "Nova Ordem de compra")
        purchase_order.purchase_orders_items.create(size: item.size, quantity: item.quantity)
      end

      value = item.product.original_price.gsub(",", ".").to_f * item.quantity.to_i
      value = value.to_f + purchase_order.value.to_f
      purchase_order.value = value
      purchase_order.save
    end
  end
end
