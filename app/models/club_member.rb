class ClubMember < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |club_member|
      club_member.provider = auth.provider
      club_member.uid = auth.uid
      club_member.email = auth.info.email
      club_member.password = Devise.friendly_token[0,20]
    end
  end

  belongs_to :club
  has_many :feedback_responses, dependent: :destroy
end
