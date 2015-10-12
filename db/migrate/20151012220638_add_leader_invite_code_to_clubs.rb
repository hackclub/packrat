class AddLeaderInviteCodeToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :leader_invite_code, :string
    add_index :clubs, :leader_invite_code
  end
end
