class DropClubMembers < ActiveRecord::Migration
  def change
    drop_table :club_members
  end
end
