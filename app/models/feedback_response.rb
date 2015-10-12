class FeedbackResponse < ActiveRecord::Base
  default_scope { order('created_at ASC') }

  belongs_to :member
  belongs_to :club_member
  belongs_to :meeting
end
