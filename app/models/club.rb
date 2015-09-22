class Club < ActiveRecord::Base
  has_many :club_leaders
  has_many :club_members
  has_many :meetings
end
