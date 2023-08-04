require "rails_helper"

RSpec.feature "Seeds", type: :feature do
  scenario "Seeds the database" do
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
      { user_id: User.first.id, departure_airport_id: Airport.find_by(code: "LCA").id, arrival_airport_id: Airport.find_by(code: "LTN").id, start_datetime: DateTime.new(2023, 8, 10, 12, 30), flight_duration: 180 },
      { user_id: User.second.id, departure_airport_id: Airport.find_by(code: "PFO").id, arrival_airport_id: Airport.find_by(code: "FRA").id, start_datetime: DateTime.new(2023, 8, 12, 15, 45), flight_duration: 240 },
    ]

    Flight.create!(flights_data)

    Rails.application.load_seed

    expect(Airport.count).to eq(6)
    expect(Flight.count).to eq(2)
    expect(User.count).to eq(2)
    expect(User.second.flights.first.departure_airport.code).to eq("PFO")
  end
end
