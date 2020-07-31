class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :role
      t.string :graduation
      t.string :level
      t.string :avatar
      t.string :phone
      t.string :social_security_number
      t.string :tax_number

      t.timestamps
    end
  end
end
