namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    def gen_uid
      return rand(0..9999999)
    end

    def create_club
      Club.create(name: "#{Faker::Address.city} High School")
    end

    def create_user(type, uid=gen_uid)
      type.create(
        user_attributes: {
          provider: 'github',
          uid: uid,
          email: Faker::Internet.email,
          name: Faker::Name.name,
          phone: Faker::PhoneNumber.phone_number
        }
      )
    end

    def create_leader(uid=gen_uid)
      create_user(Leader, uid)
    end

    def create_member(uid=gen_uid)
      create_user(Member, uid)
    end

    def create_feedback_response(meeting, member)
      target_rating = rand(-5..5)
      max_deviation = rand(1..5)
      high_rating_limit = [target_rating + max_deviation, 5].min
      low_rating_limit = [target_rating - max_deviation, -5].max

      FeedbackResponse.create(
        created_at: meeting.created_at,
        meeting: meeting,
        member: member,
        rating: rand(low_rating_limit..high_rating_limit),
        one_thing_to_improve_on: Faker::Lorem.sentence,
        one_thing_done_well: Faker::Lorem.sentence,
        anything_else_to_share: Faker::Lorem.sentence
      ).update(created_at: meeting.created_at + rand(0..60).minutes)
    end

    def create_meeting(club, week_offset=0)
      m = Meeting.create(club: club)
      m.update(created_at: m.created_at - (7.days * week_offset))

      attendee_count = rand(1..club.members.count)
      attendees = club.members.sample(attendee_count)
      attendees.each { |mem| create_feedback_response(m, mem) }

      return m
    end

    # Create clubs
    rand(8..15).times do
      c = create_club

      # Create leaders, members, and meetings
      rand(1..5).times { c.leaders << create_leader }
      rand(6..40).times { c.members << create_member }
      rand(0..5).times { |n| create_meeting(c, n) }

      puts "Created #{c.name}"
    end

    # Add our pre-created GitHub development accounts. If you'd like access to
    # the logins for these, create a GitHub issue and we'll help you get access
    # to them so you can take part in the fun.
    Club.first.leaders << create_leader('15238904')
    Club.first.members << create_member('15238880')
  end
end
