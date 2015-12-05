require 'carmen'

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

# Locations
id = Carmen::Country.named('Indonesia')

# Provinces seed
jawa = id.subregions.named('Jawa')
jawa.subregions.each do |province|
  Province.create(name: province.name, code: "id-#{province.code.downcase}" )
  puts "#{province} created"

end

papua = id.subregions.named('Papua')
papua.subregions.each do |province|
  Province.create(name: province.name, code: "id-#{province.code.downcase}" )
  puts "#{province} created"
end

kalimantan = id.subregions.named('Kalimantan')
kalimantan.subregions.each do |province|
  Province.create(name: province.name, code: "id-#{province.code.downcase}" )
  puts "#{province} created"
end

sumatera = id.subregions.named('Sumatera')
sumatera.subregions.each do |province|
  Province.create(name: province.name, code: "id-#{province.code.downcase}" )
  puts "#{province} created"
end

nusa = id.subregions.named('Nusa Tenggara')
nusa.subregions.each do |province|
  Province.create(name: province.name, code: "id-#{province.code.downcase}" )
  puts "#{province} created"
end

maluku = id.subregions.named('Maluku')
maluku.subregions.each do |province|
  Province.create(name: province.name, code: "id-#{province.code.downcase}" )
  puts "#{province} created"
end

sulawesi = id.subregions.named('Sulawesi')
sulawesi.subregions.each do |province|
  Province.create(name: province.name, code: "id-#{province.code.downcase}" )
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
    paid: 1,
    location_attributes: {
      city_id: jawa_barat.cities.order('RANDOM()').first.id,
      province_id: jawa_barat.id
    }
  )
  puts "Story from #{user.email} created"
end
