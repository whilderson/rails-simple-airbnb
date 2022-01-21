# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# remove old seed
Flat.destroy_all
puts 'All old flats destroyed'

# create 5 new flats
puts 'starting to generate 5 new flats'
5.times do
  flat = Flat.create(name: Faker::Hipster.sentence,
                      address: Faker::Address.full_address,
                      description: Faker::Hipster.paragraph,
                      price_per_night: rand(50..150),
                      number_of_guests: rand(2..6))
  puts flat.id
  puts flat.name
  puts flat.address
  puts flat.description
  puts flat.price_per_night
  puts flat.number_of_guests
  puts '____'
end

puts 'adding pictures'
Flat.all.each_with_index do |flat, index|
  urls = [
    'https://jumanji.livspace-cdn.com/magazine/wp-content/uploads/sites/2/2020/07/29191451/Interior-Design-For-2BHK-Flat-Living.jpg',
    'https://i.ytimg.com/vi/zwTSZgUmm1M/maxresdefault.jpg',
    'https://www.thepinnaclelist.com/wp-content/uploads/2020/02/Interior-Design-Ideas-How-To-Make-Your-Student-Flat-Feel-Like-Home.jpg',
    'https://kraftekstudio.com/wp-content/uploads/2018/05/Cam-1-1024x592.jpg',
    'https://www.designcurial.com/Uploads/Project/9575/images/276580/large/QUINN_113CT-tk2%20%20020.jpg'
  ]
  flat.image_url = urls[index]
  flat.save
  puts flat.image_url
end

puts 'end of generating flats'
