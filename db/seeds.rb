# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  category = Category.create(name: Faker::Hacker.ingverb)
end

20.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")
  3.times do
    post = user.posts.create(title: Faker::Company.buzzword, content: Faker::Hipster.paragraph(2, true), image: Faker::Placeholdit.image)
    post.category = Category.find(rand(1..Category.all.length))
  end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')