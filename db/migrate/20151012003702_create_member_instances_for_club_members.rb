class CreateMemberInstancesForClubMembers < ActiveRecord::Migration
  def up
    ClubMember.find_each do |cm|
      Member.create!(
        user: User.find_by(email: cm.email),
        club_id: cm.club_id
      )
    end
  end
end
