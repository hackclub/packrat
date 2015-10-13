class GenerateMissingClubLeaderInviteCodes < ActiveRecord::Migration
  # Stub class for migration
  class Club < ActiveRecord::Base
    def self.generate_leader_invite_code
      code = SecureRandom.hex(3)
      if !Club.find_by(leader_invite_code: code).nil?
        generate_leader_invite_code
      else
        code
      end
    end
  end

  def change
    Club.where(leader_invite_code: nil).find_each do |club|
      club.update(leader_invite_code: Club.generate_leader_invite_code)
    end
  end
end
