class CreateUserStarterPacks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_starter_packs do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :starter_pack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
