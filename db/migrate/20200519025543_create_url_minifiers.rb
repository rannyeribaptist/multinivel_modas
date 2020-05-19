class CreateUrlMinifiers < ActiveRecord::Migration[6.0]
  def change
    create_table :url_minifiers do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :code
      t.string :number

      t.timestamps
    end
  end
end
