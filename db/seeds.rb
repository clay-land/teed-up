Bag.destroy_all
User.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brands = %w[Titleist Callaway Nike Ping Taylormade Cobra Mizuno]

10.times do
  user = User.new(email: Faker::Internet.unique.safe_email)
  user.password = "123456"
  user.save!
  Bag.create!(name: "#{brands.sample} #{Faker::Creature::Horse.name}" , description: Faker::Hipster.paragraph(sentence_count: 2), location: Faker::Address.full_address, rate: rand(10.0..50.0).round(2), user: User.all.sample )
end

