# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Menu Items"
MenuItem.create(name: "Chocolate Chip Cookies",
                description: "A dozen of heavenly crunchy on the outside
                             and chewy on inside goodness. Gluten-Free",
                price: 600)
MenuItem.create(name: "Deep Chocolate Brownies",
                description: "Twenty squares of fudgy brownies made of
                              premium dark chocolate. Gluten-Free",
                price: 500)
MenuItem.create(name: "New York Style Cheesecake",
                description: "A classic, made from premium cream cheese and a
                             crumble crust. Our best-seller. Gluten-free",
                price: 600)

puts "Done seeding"
