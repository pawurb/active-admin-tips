# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email
  )
end

user_ids = User.pluck(:id)

1000.times do
  Post.create(
    title: Faker::Lorem.sentence(1),
    content: Faker::Lorem.sentence(3),
    user_id: user_ids.sample
  )
end
