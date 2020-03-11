class CreateCreditInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_informations do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :number
      t.string :name
      t.string :security_digit
      t.string :date

      t.timestamps
    end
  end
end
