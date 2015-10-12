class User < ActiveRecord::Base
  belongs_to :meta, polymorphic: true

  def self.create_from_auth_hash(auth_hash)
    create! do |user|
      user.provider = auth_hash.provider
      user.uid = auth_hash.uid
      user.email = auth_hash.info.email
      user.name = auth_hash.info.name
      user.phone = auth_hash.info.phone
    end
  end
end
