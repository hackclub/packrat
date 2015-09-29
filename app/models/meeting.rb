class Meeting < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :club
  has_many :feedback_responses, dependent: :destroy

  def attendee_count
    self.feedback_responses.count
  end

  def average_rating
    ratings = self.feedback_responses.map { |resp| resp.rating }
    ratings.inject { |sum, el| sum + el }.to_f / ratings.size
  end

  def attendee_count_percentage_delta(meeting)
    percentage_delta(self.attendee_count, meeting.attendee_count)
  end

  def average_rating_percentage_delta(meeting)
    percentage_delta(self.average_rating, meeting.average_rating)
  end

  private

  def percentage_delta(c1, c2)
    delta = c1 - c2
    delta.to_f / c1 * 100
  end
end
