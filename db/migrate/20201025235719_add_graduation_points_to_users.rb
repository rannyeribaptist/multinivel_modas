class AddGraduationPointsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :graduation_points, :bigint
  end
end
