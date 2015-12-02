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

70.times do |user|
  user = User.order('RANDOM()').first
  user.stories.create(
    title: Faker::Lorem.sentence,
    category: Category.order('RANDOM()').first,
    content: Faker::Hipster.paragraph(10),
    amount: Faker::Commerce.price * 1000,
    event_date: Date.today,
    email: user.email,
    location_attributes: {
      city_id: 1,
      province_id: 1
    }
  )
  puts "Story from #{user.email} created"
end
