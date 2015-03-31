# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#SEED MALES
10.times do
  Person.create(
    height: rand(66..78),
    weight: rand(15..220),
    gender: 1,
  )
end

#SEED FEMALES
10.times do
  Person.create(
    height: rand(62..70),
    weight: rand(110..170),
    gender: -1,
  )
end