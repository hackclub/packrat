# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

clubs = ['Armijo High School',
         'Austin High School',
         'Bronx High School ofScience',
         'Camino Nuevo High School',
         'Cherry Hill High School East',
         'CollegePark High School',
         'Columbia Secondary School',
         'Cranbrook Schools',
         'CrenshawHigh School',
         'Downey High School',
         'Elizabeth High School',
         'El Segundo HighSchool',
         'Garfield Senior High School',
         'Gig Harbor High School',
         'GlenaeonRudolf Steiner School',
         'Gunn High School',
         'Hack Camp',
         'HS Hackers/Coded withKids Meetup',
         'Huntington Park High School',
         'International Academy East','Linda Márquez High School',
         'Locke High School',
         'Los Altos High School','Lowell High School',
         'Lower Moreland High School',
         'Menlo School',
         'MiddlesexCounty Academy',
         'Mission Vista High School',
         'Morris County School ofTechnology',
         'Mundelein High School',
         'Oscar de la Hoya Ánimo Charter HighSchool',
         'Project Cipher',
         'Raleigh Charter High School',
         'Ravenwood HighSchool',
         'Robert F. Kennedy Community Schools',
         'San Francisco University HighSchool',
         'San Leandro High School',
         'San Mateo High School',
         'Santa Teresa HighSchool',
         'South Brunswick High School',
         'The Shri Ram School - DLF Campus',
         'Thunderridge High School',
         'Townsend Harris High School',
         'Twin CitiesAcademy',
         'USC Hybrid High School',
         'West Adams High School',
         'West Orange High School']

for club in clubs
  if Club.where(name: club).to_a.length == 0
    Club.create(name: club)
  end
end
