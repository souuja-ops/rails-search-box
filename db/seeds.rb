# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Deletes existing recipes, useful if you seed several times
Post.destroy_all

# Creates 1000 fake recipes
100.times do
    Post.create!(
        author: "#{Faker::Book.author} by #{Faker::Name.unique.name}",
        title: "#{Faker::Book.title}, #{Faker::Book.title}",
        body: Faker::Lorem.paragraphs,
        tags: Faker::Book.genre
    )
end 

# Displays the following message in the console once the seeding is done
puts 'Posts created'
