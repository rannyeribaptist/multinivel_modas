class CreateBankAccountInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_account_informations do |t|
      t.string :account_number
      t.string :owner_name
      t.string :operation
      t.string :account_type
      t.string :agency_number
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
