class CreateStarterPacks < ActiveRecord::Migration[6.0]
  def change
    create_table :starter_packs do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.string :price

      t.timestamps
    end
  end
end
