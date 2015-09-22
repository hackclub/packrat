# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

clubs = ['Armijo High School',
         'Cherry Hill High School East',
         'College Park High School',
         'Columbia Secondary School',
         'Elizabeth High School',
         'Glenaeon Rudolf Steiner School',
         'Lowell High School',
         'Project Cipher',
         'Radnor High School',
         'Ravenwood High School',
         'San Leandro High School',
         'South Brunswick High School',
         'USC Hybrid High School']

for club in clubs
  unless Club.find_by(name: club)
    Club.create(name: club)
  end
end

if Rails.env.development?
  unless Club.find_by(name: 'Foobar High School')
    Club.create(name: 'Foobar High School')
  end
  unless ClubMember.find_by(email: 'foo@bar.com')
    ClubMember.create(email: 'foo@bar.com', password: 'password', club_id: Club.find_by(name: 'Foobar High School').id)
  end
end
