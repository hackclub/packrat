class Meeting < ActiveRecord::Base
  belongs_to :club
  has_many :feedback_responses
end
