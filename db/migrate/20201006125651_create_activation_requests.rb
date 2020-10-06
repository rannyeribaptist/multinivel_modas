class CreateActivationRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :activation_requests do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.bigint :requested_id

      t.timestamps
    end
  end
end
