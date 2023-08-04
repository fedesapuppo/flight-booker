# spec/factories/flights.rb
FactoryBot.define do
  factory :flight do
    association :user
    association :departure_airport, factory: :airport
    association :arrival_airport, factory: :airport
    start_datetime { DateTime.new(2023, 8, 10, 12, 30) }
    flight_duration { 180 }
  end
end
