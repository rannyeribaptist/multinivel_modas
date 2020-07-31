class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :street
      t.string :neightbohood
      t.string :city
      t.string :state
      t.string :number
      t.string :complement

      t.timestamps
    end
  end
end
