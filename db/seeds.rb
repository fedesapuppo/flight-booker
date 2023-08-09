# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

Airport.delete_all
Flight.delete_all
User.delete_all

airports_data = [
  { code: "LCA", name: "Larnaca" },
  { code: "PFO", name: "Paphos" },
  { code: "ECN", name: "Ercan" },
  { code: "LTN", name: "London Luton" },
  { code: "FRA", name: "Frankfurt" },
  { code: "EZE", name: "Ezeiza" },
]

Airport.create!(airports_data)

users_data = [
  { email: "fede@sapu.com", password: "123456" },
  { email: "fede2@sapu.com", password: "123456" },
]

User.create!(users_data)

flights_data = [
  { departure_airport_id: Airport.find_by(code: "LCA").id, arrival_airport_id: Airport.find_by(code: "LTN").id, start_datetime: DateTime.new(2023, 8, 10, 12, 30), flight_duration: 180 },
  { departure_airport_id: Airport.find_by(code: "PFO").id, arrival_airport_id: Airport.find_by(code: "FRA").id, start_datetime: DateTime.new(2023, 8, 12, 15, 45), flight_duration: 240 },
]

Flight.create!(flights_data)
