class CreateMemberInstancesForClubMembers < ActiveRecord::Migration
  # Temporary class used for migration
  class ClubMember < ActiveRecord::Base
    belongs_to :club
  end

  def up
    ClubMember.find_each do |cm|
      Member.create!(
        user: User.find_by(email: cm.email),
        club_id: cm.club_id
      )
    end
  end
end
