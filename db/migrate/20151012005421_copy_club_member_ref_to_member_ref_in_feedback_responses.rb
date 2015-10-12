class CopyClubMemberRefToMemberRefInFeedbackResponses < ActiveRecord::Migration
  # Temporary class used for migration
  class ClubMember < ActiveRecord::Base
    belongs_to :club
  end

  def up
    FeedbackResponse.find_each do |resp|
      if resp.club_member_id
        cm = ClubMember.find(resp.club_member_id)

        user = nil
        if cm.email
          user = User.find_by(email: cm.email)
        elsif cm.uid and cm.provider
          user = User.find_by(uid: cm.uid, provider: cm.provider)
        end

        resp.update(member: user.meta)
      end
    end
  end

  def down
    FeedbackResponse.find_each do |resp|
      resp.update(member: nil)
    end
  end
end
