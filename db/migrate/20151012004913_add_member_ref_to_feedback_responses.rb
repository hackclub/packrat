class AddMemberRefToFeedbackResponses < ActiveRecord::Migration
  def change
    add_reference :feedback_responses, :member, index: true, foreign_key: true
  end
end
