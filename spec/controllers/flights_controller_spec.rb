require "rails_helper"

RSpec.describe FlightsController, type: :controller do
  describe "GET #index" do
    it "returns all flights if no search parameters are provided" do
      get :index
      expect(assigns(:flights)).to eq(Flight.all)
    end

    it "filters flights by departure airport" do
      departure_airport = FactoryBot.create(:airport)
      flight_with_departure = FactoryBot.create(:flight, departure_airport: departure_airport)
      FactoryBot.create(:flight)

      get :index, params: { flight_search: { departure_airport: departure_airport.id } }
      expect(assigns(:flights)).to eq([flight_with_departure])
    end

    it "filters flights by arrival airport" do
      arrival_airport = FactoryBot.create(:airport)
      flight_with_arrival = FactoryBot.create(:flight, arrival_airport: arrival_airport)
      FactoryBot.create(:flight)

      get :index, params: { flight_search: { arrival_airport: arrival_airport.id } }
      expect(assigns(:flights)).to eq([flight_with_arrival])
    end
    require "rails_helper"

    it "filters flights by flight date" do
      user = FactoryBot.create(:user)
      start_datetime = DateTime.new(2023, 8, 10, 12, 30)
      flight_with_start_datetime = FactoryBot.create(:flight, start_datetime: start_datetime)
      FactoryBot.create(:flight, start_datetime: start_datetime + 1.day)

      get :index, params: { flight_search: { flight_date: start_datetime.strftime("%Y-%m-%d") } }

      expected_flights = [flight_with_start_datetime].pluck(:id, :departure_airport_id, :arrival_airport_id, :start_datetime, :flight_duration, :created_at)
      actual_flights = assigns(:flights).pluck(:id, :departure_airport_id, :arrival_airport_id, :start_datetime, :flight_duration, :created_at)

      expect(actual_flights).to eq(expected_flights)
    end
  end
end
