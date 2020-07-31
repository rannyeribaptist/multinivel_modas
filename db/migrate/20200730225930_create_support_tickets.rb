class CreateSupportTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :support_tickets do |t|
      t.string :ticket
      t.string :filled_by
      t.belongs_to :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
