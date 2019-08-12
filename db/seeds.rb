# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:"paulmouchel@yopmail.com", description:"Salut, moi c'est Paul, je fais THP", first_name:"Paul", last_name:"Mouchel")
User.create(email:"pierre.michel@yopmail.com", description:"Salut, moi c'est Pierre, je fais THP", first_name:"Pierre", last_name:"Michel")

