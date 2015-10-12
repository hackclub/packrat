class CreateMemberInstancesForClubMembers < ActiveRecord::Migration
  # Temporary class used for migration
  class ClubMember < ActiveRecord::Base
    belongs_to :club
  end

  def up
    ClubMember.find_each do |cm|
      u = User.find_by(email: cm.email) ||
        User.find_by(uid: cm.uid)

      Member.create!(
        user: u,
        club_id: cm.club_id
      )
    end
  end
end
