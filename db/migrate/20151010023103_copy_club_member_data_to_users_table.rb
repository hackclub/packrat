class CopyClubMemberDataToUsersTable < ActiveRecord::Migration
  def up
    ClubMember.find_each do |m|
      User.record_timestamps = false
      User.create!(
        created_at: m.created_at,
        updated_at: m.updated_at,
        provider: m.provider,
        uid: m.uid,
        email: m.email,
        name: m.full_name,
        phone: m.phone
      )
      User.record_timestamps = true
    end
  end
  def down
    User.destroy_all
  end
end
