require 'csv'

CSV.foreach("db/csv/provinsi.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  Province.create(row.to_hash)
end

CSV.foreach("db/csv/kota_dan_kabupaten.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  City.create(row.to_hash)
end

# User for guest stories
User.create(
  name: 'Anonymous',
  email: 'anon@ymous.com',
  password: 'asdqwe123',
  password_confirmation: 'asdqwe123'
)

# Random users
30.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    password: 'asdqwe123',
    password_confirmation: 'asdqwe123'
  )
end

jawa_barat = Province.find_by_name('Jawa Barat')


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
    paid: 1,
    location_attributes: {
      city_id: jawa_barat.cities.order('RANDOM()').first.id,
      province_id: jawa_barat.id
    }
  )
  puts "Story from #{user.email} created"
end
