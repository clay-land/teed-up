Bag.destroy_all
User.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

# file = helper.asset_url("bag_1.jpg")
# article = Article.new(title: 'NES', body: "A great console")
# article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

brands = %w[Titleist Callaway Nike Ping Taylormade Cobra Mizuno]
bag_num = (1..7).to_a

puts "Creating Users"

10.times do
  user = User.new(email: Faker::Internet.unique.safe_email)
  user.password = "123456"
  user.save!
end

puts "Users Ok !"

puts "Creating Bags"

Bag.create!(name: "#{brands.sample} #{Faker::Creature::Horse.name}" , description: Faker::Hipster.paragraph(sentence_count: 2), location: "Indiantown, US", rate: rand(10.0..50.0).round(2), user: User.all.sample)
Bag.create!(name: "#{brands.sample} #{Faker::Creature::Horse.name}" , description: Faker::Hipster.paragraph(sentence_count: 2), location: "Tallahassee, US", rate: rand(10.0..50.0).round(2), user: User.all.sample )
Bag.create!(name: "#{brands.sample} #{Faker::Creature::Horse.name}" , description: Faker::Hipster.paragraph(sentence_count: 2), location: "Tampa, US", rate: rand(10.0..50.0).round(2), user: User.all.sample )
Bag.create!(name: "#{brands.sample} #{Faker::Creature::Horse.name}" , description: Faker::Hipster.paragraph(sentence_count: 2), location: "JacksonVille, US", rate: rand(10.0..50.0).round(2), user: User.all.sample )
Bag.create!(name: "#{brands.sample} #{Faker::Creature::Horse.name}" , description: Faker::Hipster.paragraph(sentence_count: 2), location: "Saint-Augustine, US", rate: rand(10.0..50.0).round(2), user: User.all.sample )
Bag.create!(name: "#{brands.sample} #{Faker::Creature::Horse.name}" , description: Faker::Hipster.paragraph(sentence_count: 2), location: "Miami, US", rate: rand(10.0..50.0).round(2), user: User.all.sample )
Bag.create!(name: "#{brands.sample} #{Faker::Creature::Horse.name}" , description: Faker::Hipster.paragraph(sentence_count: 2), location: "Bradenton, US", rate: rand(10.0..50.0).round(2), user: User.all.sample )
Bag.create!(name: "#{brands.sample} #{Faker::Creature::Horse.name}" , description: Faker::Hipster.paragraph(sentence_count: 2), location: "ClearWater, US", rate: rand(10.0..50.0).round(2), user: User.all.sample )
Bag.create!(name: "#{brands.sample} #{Faker::Creature::Horse.name}" , description: Faker::Hipster.paragraph(sentence_count: 2), location: "Gainesville, US", rate: rand(10.0..50.0).round(2), user: User.all.sample )
Bag.create!(name: "#{brands.sample} #{Faker::Creature::Horse.name}" , description: Faker::Hipster.paragraph(sentence_count: 2), location: "Orlando, US", rate: rand(10.0..50.0).round(2), user: User.all.sample )

puts "Bags Ok !"

Bag.all.each do |bag|
  rand(1..3).times { bag.photos.attach(io: File.open("./app/assets/images/bag_#{bag_num.sample}.jpg"), filename: 'file.jpg') }
end

puts "Images Ok !"


