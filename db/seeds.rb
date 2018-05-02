# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Menu Items"
MenuItem.create(
                sku: "cccookies",
                name: "Chocolate Chip Cookies",
                description: "A dozen of heavenly crunchy on the outside
                             and chewy on inside goodness. Gluten-Free",
                price_cents: 60000,
                photo_url: 'chocolate-chip.jpg'
                )
MenuItem.create(
                sku: "brownies",
                name: "Deep Chocolate Brownies",
                description: "Twenty squares of fudgy brownies made of
                              premium dark chocolate. Gluten-Free",
                price_cents: 50000,
                photo_url: 'fudge-brownies.jpg'
                )
MenuItem.create(
                sku: "cheesecake",
                name: "New York Style Cheesecake",
                description: "A classic, made from premium cream cheese and a
                             crumble crust. Our best-seller. Gluten-free",
                price_cents: 60000,
                photo_url: 'cheesecake.jpg'
                )

puts "Creating User"
User.create!(
             email: "user@example.org",
             password: "123456"
             )

User.create!(
             email: "admin@gfb.org",
             password: "123456",
             admin: true
             )

puts "Creating posts"
Post.create!(
  title: "Hello World!",
  content: "Thank you for visiting our site!"
  )
Post.create!(
  title: "Grand-opening on May 9, 2018",
  content: "We will be having our grand opening soon! We hope to see you there! Free cookies for the first 50 customers!"
  )
Post.create!(
  title: "All you can eat bakes!",
  content: "For P500, you can eat all the bakes you want. Promo ends on July 5."
  )
Post.create!(
  title: "Cooldown this summer! Free scoop of ice cream!",
  content: "Drop by our store and get a free scoop of ice cream for every P500 worth of orders!"
  )

puts "Done seeding"
