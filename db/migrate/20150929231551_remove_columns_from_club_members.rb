class RemoveColumnsFromClubMembers < ActiveRecord::Migration
  def change
    remove_column :club_members, :password, :string
    remove_column :club_members, :encrypted_password, :string
    remove_column :club_members, :reset_password_token, :string
    remove_column :club_members, :reset_password_sent_at, :string
    remove_column :club_members, :remember_created_at, :string
  end
end
