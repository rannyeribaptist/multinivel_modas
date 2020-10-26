class AddGraduationValueToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :graduation_value, :float
  end
end
