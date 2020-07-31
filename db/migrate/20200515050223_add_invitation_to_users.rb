class AddInvitationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :invitation_token, :string
    add_column :users, :invited_by_id, :string
    add_column :users, :invited_by_token, :string
    add_column :users, :invited_ids, :string, array: true, default: [].to_yaml
  end
end
