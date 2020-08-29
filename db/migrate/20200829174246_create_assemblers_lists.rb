class CreateAssemblersLists < ActiveRecord::Migration[6.0]
  def change
    create_table :assemblers_lists do |t|
      t.bigint :last_assembler_id
      t.bigint :next_assembler_id
      t.string :assemblers_list

      t.timestamps
    end
  end
end
