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
end
