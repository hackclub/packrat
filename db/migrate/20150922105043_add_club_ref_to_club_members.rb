class AddClubRefToClubMembers < ActiveRecord::Migration
  def change
    add_reference :club_members, :club, index: true, foreign_key: true
  end
end
