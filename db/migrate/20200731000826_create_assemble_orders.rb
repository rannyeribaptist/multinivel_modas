class CreateAssembleOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :assemble_orders do |t|
      t.integer :last_assembler
      t.integer :next_assembler
      t.string :assembler_list, array: true, default: [].to_yaml

      t.timestamps
    end
  end
end
