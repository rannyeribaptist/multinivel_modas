class AddCepToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :cep, :string
  end
end
