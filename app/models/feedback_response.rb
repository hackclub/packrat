class FeedbackResponse < ActiveRecord::Base
  belongs_to :club_members
  belongs_to :meeting
end
