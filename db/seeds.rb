# Seed database to have sample data to base guesses upon:

#Seed Males:
50.times do
  Person.create(
    height: rand(68..78),
    weight: rand(150..220),
    gender: 1,
  )
end
# Make a correct guess to avoid zero division error:
1.times do
  Person.create(
    height: rand(68..78),
    weight: rand(150..220),
    gender: 1,
    guess_correct: true
  )
end


#Seed Females:
50.times do
  Person.create(
    height: rand(62..70),
    weight: rand(110..170),
    gender: -1
  )
end
# Make a correct guess to avoid zero division error:
1.times do
  Person.create(
    height: rand(68..78),
    weight: rand(150..220),
    gender: 1,
    guess_correct: true
  )
end