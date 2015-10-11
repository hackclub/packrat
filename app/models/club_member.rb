class ClubMember < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :trackable

  belongs_to :club
  has_many :feedback_responses, dependent: :destroy
end
