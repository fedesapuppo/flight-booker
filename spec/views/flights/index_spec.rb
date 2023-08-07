require "rails_helper"

RSpec.describe "flights/index", type: :view do
  include Devise::Test::ControllerHelpers

  it "displays a list of flights with airport names" do
    user = FactoryBot.create(:user)
    flight = FactoryBot.create(:flight)
    assign(:flights, [flight])
    render

    expect(rendered).to have_content("Departure Airport: #{flight.departure_airport.name}")
    expect(rendered).to have_content("Arrival Airport: #{flight.arrival_airport.name}")
  end

  it "displays a search form with dropdown menus" do
    user = FactoryBot.create(:user)
    flight = FactoryBot.create(:flight)
    assign(:flights, [flight])
    render

    expect(rendered).to have_selector("form[action='#{flights_path}'][method='get']") do
      expect(rendered).to have_selector("select[name='flight_search[departure_airport]']")
      expect(rendered).to have_selector("select[name='flight_search[arrival_airport]']")
      expect(rendered).to have_selector("select[name='flight_search[passenger_count]']")
      expect(rendered).to have_selector("select[name='flight_search[flight_date]']")
      expect(rendered).to have_selector("input[type='submit'][value='Search Flights']")
    end
  end
end
