class CreateClubsLeaders < ActiveRecord::Migration
  def change
    create_table :clubs_leaders, id: false do |t|
      t.belongs_to :leader, index: true
      t.belongs_to :club, index: true
    end
  end
end
