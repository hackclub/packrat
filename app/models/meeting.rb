class Meeting < ActiveRecord::Base
  belongs_to :club
  has_many :feedback_responses, dependent: :destroy

  def average_rating
    ratings = self.feedback_responses.map { |resp| resp.rating }
    ratings.inject { |sum, el| sum + el }.to_f / ratings.size
  end
end
