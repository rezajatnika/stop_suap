require 'carmen'
include Carmen

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
jawa = Country.named('Indonesia').subregions.named('Jawa')
jawa.subregions.map { |reg| reg.name }.each do |province|
  Province.create(name: province)
  puts "#{province} created"
end

jawa_barat = Province.find_by_name('Jawa Barat')
jawa_barat.cities.create(
  [
    { name: 'Kota Bandung' },
    { name: 'Kota Cimahi' },
    { name: 'Kabupaten Bandung Barat' }
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
      city_id: jawa_barat.cities.order('RANDOM()').first.id,
      province_id: jawa_barat.id
    }
  )
  puts "Story from #{user.email} created"
end
