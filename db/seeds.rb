# User for guest stories
User.create(
  email: 'anon@ymous.com',
  password: 'asdqwe123',
  password_confirmation: 'asdqwe123'
)

# Random users
30.times do
  User.create(
    email: Faker::Internet.free_email,
    password: 'asdqwe123',
    password_confirmation: 'asdqwe123'
  )
end

# Locations
west_java = Province.create(name: 'West Java')
west_java.cities.create(
  [
    { name: 'Kota Bandung' },
    { name: 'Kota Cimahi' },
    { name: 'Kabupaten Bandung' }
  ]
)

Category.create(
  [
    { name: 'Tax Office' },
    { name: 'Traffic Ticket' },
    { name: 'Public Service' }
  ]
)

20.times do
  User.order('RANDOM()').first.stories.create(
    title: Faker::Lorem.sentence,
    category_id: Category.order('RANDOM()').first.id,
    content: Faker::Lorem.paragraph,
    amount: (rand(10) + 1) * 100_000,
    event_date: Date.today
  )
end

Story.all.each do |story|
  story.create_location(city_id: 1, province_id: 1)
end
