class FeedbackResponse < ActiveRecord::Base
  belongs_to :club_member
  belongs_to :meeting
end
