# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require 'faker'
puts "Destroying the existing Rentals, Users and Tools !!!"
Rental.destroy_all
User.destroy_all
Tool.destroy_all
puts "Creating the User -"
user_1 = User.create!(email: 'user@test.com', password: 'welcome1')
condition = ['Brand New', 'Moderately Used', 'Warranty Expired', 'Recently Serviced']


photos = ['https://images.unsplash.com/photo-1534398079543-7ae6d016b86a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1540103711724-ebf833bde8d1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1503789146722-cf137a3c0fea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1581621293775-7aac902d7032?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1505855796860-aa05646cbf1f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1490557162706-284736f48784?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1580402427914-a6cc60d7d44f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1504148455328-c376907d081c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1513467655676-561b7d489a88?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1508872558182-ffc7f1b387f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1531873252757-8c22fa9e7a98?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1583031537966-8d186811d75c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1577372440262-d86980dc1d62?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1560793385-16b0e5de8590?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1503507739298-dce173d09653?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1583882483713-6314403234c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1529836349180-223cd77d8cb6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjIxMTIzfQ&auto=format&fit=crop&w=500&q=60']



puts 'Creating 15 tools..'

15.times do |i|
  tool = Tool.create!(
    name:    Faker::Appliance.equipment,
    #name:  Faker::Commerce.product_name,
    description: Faker::Appliance.brand,
    condition: condition.sample,
    price: Faker::Commerce.price(range: 1..10.0, as_string: true),
    address: Faker::Address.city,
    user: user_1)
  
  file = URI.open(photos.sample)
  sleep 0.5
  tool.photos.attach(io: file, filename: "#{tool.name}", content_type: 'image/png')
  puts "#{i + 1}.  #{tool.name}, --> #{tool.condition},     --> $#{tool.price} USD"
end
puts 'Finished!'
