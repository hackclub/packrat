class FeedbackResponse < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :club_member
  belongs_to :meeting
end
