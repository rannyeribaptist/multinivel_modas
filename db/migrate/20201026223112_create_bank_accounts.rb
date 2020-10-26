class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.string :bank
      t.string :agency
      t.string :account_number
      t.string :kind
      t.string :owner
      t.string :registration_number
      t.string :aditional_description

      t.timestamps
    end
  end
end
