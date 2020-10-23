class AddMigrationFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :numero, :string
    add_column :users, :patrocinador, :string
    add_column :users, :indicador, :string
  end
end
