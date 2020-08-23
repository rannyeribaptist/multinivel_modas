class CreateMercadoPagoGets < ActiveRecord::Migration[6.0]
  def change
    create_table :mercado_pago_gets do |t|
      t.text :response

      t.timestamps
    end
  end
end
