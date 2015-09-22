class AddColumnsToClubMembers < ActiveRecord::Migration
  def change
    add_column :club_members, :provider, :string
    add_column :club_members, :uid, :string
  end
end
