class Club < ActiveRecord::Base
  has_many :club_leaders
  has_many :club_members
  has_many :members
  has_many :meetings, dependent: :destroy

  # Returns the number of feedback responses submitted at the last meeting. If
  # there was no last meeting, then returns nil.
  def last_feedback_count
    if !self.meetings.last
      return nil
    end

    self.meetings.last.feedback_responses.count
  end

  # Returns the date of the last meeting's creation time. If there was no last
  # meeting, returns nil.
  def last_meeting_date
    if !self.meetings.last
      return nil
    end

    self.meetings.last.created_at
  end
end
