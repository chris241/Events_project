# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all

#Création de users
5.times do
	email = "pierre.michel@yopmail.com"
	description = Faker::TvShows::Community.quotes
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	User.create(email:email, description:description, first_name:first_name, last_name:last_name)
end

#Créations d'events
3.times do
	start_date = Faker::Time.forward(days: 60)
	duration = rand(9)*60 + rand(12)*5
	title = Faker::Music::RockBand.name
	description = Faker::Movies::StarWars.quote
	price = rand(1..1000)
	location = Faker::Address.full_address
	admin = User.all.sample
	Event.create(start_date:start_date, duration:duration, title:title, description:description, price:price, location:location, admin:admin)
end

# Création d'attendances
	5.times do
    stripe_customer_id = ""
    participant = User.all.sample
    event = Event.all.sample
  	Attendance.create(stripe_customer_id: stripe_customer_id, participant: participant, event: event)
end


