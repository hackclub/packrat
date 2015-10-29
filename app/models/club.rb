class Club < ActiveRecord::Base
  before_validation :set_leader_invite_code

  has_many :club_leaders
  has_many :club_members
  has_and_belongs_to_many :leaders
  has_many :members
  has_many :meetings, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def self.generate_leader_invite_code
    code = SecureRandom.hex(3)
    if !Club.find_by(leader_invite_code: code).nil?
      generate_leader_invite_code
    else
      code
    end
  end

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

  private

  def set_leader_invite_code
    self.leader_invite_code ||= Club.generate_leader_invite_code
  end
end
