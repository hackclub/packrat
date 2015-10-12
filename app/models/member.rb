class Member < ActiveRecord::Base
  has_one :user, as: :meta, dependent: :destroy
  accepts_nested_attributes_for :user
  validates_presence_of :user

  belongs_to :club

  def self.create_from_auth_hash(auth_hash)
    create!(
      user_attributes: {
        provider: auth_hash.provider,
        uid: auth_hash.uid,
        email: auth_hash.info.email,
        name: auth_hash.info.name,
        phone: auth_hash.info.phone
      }
    )
  end
end
