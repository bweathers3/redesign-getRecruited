8.times do
   User.create!(
     firstName:   Faker::Name.first_name,
     secondName:  Faker::Name.unique.last_name,
     email:       Faker::Internet.unique.email
   )
end

users = User.all

20.times do
  Athlete.create!(
      user:   users.sample,
      firstName:   Faker::Name.first_name,
      secondName:  Faker::Name.unique.last_name,
      active:      Faker::Boolean.boolean(0.7)
  )
end

athletes = Athlete.all

30.times do
  Sport.create!(
    athlete:      athletes.sample,
    sportName:    ["Mens Swimming", "Womens Swimming", "Mens Diving", "Womens Diving", "Mens Water Polo", "Womens Water Polo" ].sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Athlete.count} athletes created"
puts "#{Sport.count} sports created for the athletes"
