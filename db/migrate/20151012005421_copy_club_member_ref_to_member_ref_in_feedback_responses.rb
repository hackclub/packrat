class CopyClubMemberRefToMemberRefInFeedbackResponses < ActiveRecord::Migration
  # Temporary class used for migration
  class ClubMember < ActiveRecord::Base
    belongs_to :club
  end

  def up
    FeedbackResponse.find_each do |resp|
      member = ClubMember.find(resp.club_member_id)
      resp.update(member: User.find_by(email: member.email).meta)
    end
  end

  def down
    FeedbackResponse.find_each do |resp|
      resp.update(member: nil)
    end
  end
end
