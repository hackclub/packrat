class AddClubMemberRefToFeedbackResponses < ActiveRecord::Migration
  def change
    add_reference :feedback_responses, :club_member, index: true, foreign_key: true
  end
end
