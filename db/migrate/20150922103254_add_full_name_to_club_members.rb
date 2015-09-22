class AddFullNameToClubMembers < ActiveRecord::Migration
  def change
    add_column :club_members, :full_name, :string
  end
end
