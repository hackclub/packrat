class CopyClubMemberRefToMemberRefInFeedbackResponses < ActiveRecord::Migration
  def up
    FeedbackResponse.find_each do |resp|
      resp.update(member: User.find_by(email: resp.club_member.email).meta)
    end
  end

  def down
    FeedbackResponse.find_each do |resp|
      resp.update(member: nil)
    end
  end
end
