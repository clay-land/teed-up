# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brands = %w[titleist callaway nike ping taylormade cobra mizuno ]

10.times do
  User.create(email: Faker::Internet.unique.safe_email)
  Bag.create(name: "#{brand.sample} #{Faker::Creature::Horse.name}" , description: Faker::Hipster.paragraph(sentence_count: 2), location: Faker::Address.full_address, rate: rand(10.0..50.0).round(2), user_id:  )
end
