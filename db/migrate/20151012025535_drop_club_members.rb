class DropClubMembers < ActiveRecord::Migration
  def change
    remove_reference :feedback_responses, :club_member, index: true

    drop_table :club_members
  end
end
