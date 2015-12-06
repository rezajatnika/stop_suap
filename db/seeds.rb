require 'csv'

options = {
  encoding: 'UTF-8',
  headers: true,
  header_converters: :symbol,
  converters: :all
}

CSV.foreach('db/csv/provinsi.csv', options) do |row|
  Province.create(row.to_hash)
  puts "#{row[0]} created"
end

CSV.foreach('db/csv/kota_dan_kabupaten.csv', options) do |row|
  City.create(row.to_hash)
  puts "#{row[0]} created"
end

# User for guest stories
User.create(
  name: 'Anonymous',
  email: 'anon@ymous.com',
  password: 'asdqwe123',
  password_confirmation: 'asdqwe123'
)

# Random users
10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    password: 'asdqwe123',
    password_confirmation: 'asdqwe123'
  )
end

Category.create(
  [
    { name: 'Tax Office' },
    { name: 'Traffic Ticket' },
    { name: 'Public Service' },
    { name: 'Health Service' },
    { name: 'Police' }
  ]
)

250.times do |user|
  province = Province.order('RANDOM()').first
  city = province.cities.order('RANDOM()').first
  user = User.order('RANDOM()').first
  user.stories.create(
    title: Faker::Lorem.sentence,
    category: Category.order('RANDOM()').first,
    content: Faker::Hipster.paragraph(10),
    amount: Faker::Commerce.price * 1000,
    event_date: Date.today,
    paid: 1,
    location_attributes: {
      city_id: city.id,
      province_id: province.id
    }
  )
  puts "Story from #{user.email} created"
end
