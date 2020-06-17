# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "Destroying the existing Users and Tools !!!"
User.destroy_all
Tool.destroy_all
puts "Creating the User -"
user_1 = User.create!(email: 'user@test.com', password: 'welcme1')
condition = ['Brand New', 'Moderately Used', 'Warranty Expired', 'Recently Serviced']

puts 'Creating 50 tools..'
50.times do |i|
  tool = Tool.create!(
    name:    Faker::Appliance.equipment,
    description: Faker::Appliance.brand,
    condition: condition.sample,
    price: Faker::Commerce.price(range: 1..10.0, as_string: true),
    user: user_1
  )
  puts "#{i + 1}.  #{tool.name}, --> #{tool.condition},     --> $#{tool.price} USD"
end
puts 'Finished!'
