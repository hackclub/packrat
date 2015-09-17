# coding: utf-8
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
  if Club.where(name: club).to_a.length == 0
    Club.create(name: club)
  end
end
