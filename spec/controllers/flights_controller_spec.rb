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
    it "filters flights by flight date" do
      start_datetime = DateTime.new(2023, 8, 10, 12, 30)
      user = FactoryBot.create(:user)

      flight_with_start_datetime = FactoryBot.create(:flight, start_datetime: start_datetime, user: user)
      FactoryBot.create(:flight, user: user)

      get :index, params: { flight_search: { start_datetime: start_datetime } }

      expected_result = [{ "arrival_airport_id" => 4, "departure_airport_id" => 3, "flight_duration" => 180, "id" => 1, "start_datetime" => start_datetime, "user_id" => 2 }]
      actual_result = assigns(:flights).map { |f| f.attributes.except("created_at", "updated_at") }

      expect(actual_result).to include(expected_result[0])
    end
  end
end
