class DropClubLeaders < ActiveRecord::Migration
  def change
    drop_table :club_leaders
  end
end
