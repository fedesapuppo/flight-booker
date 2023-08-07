class FlightsController < ApplicationController
  def index
    @flight_search = FlightSearch.new(flight_search_params)
    @flights = Flight.all
    @flights = @flights.where(departure_airport_id: @flight_search.departure_airport) if @flight_search.departure_airport.present?
    @flights = @flights.where(arrival_airport_id: @flight_search.arrival_airport) if @flight_search.arrival_airport.present?
    @flights = @flights.where(passenger_count: @flight_search.passenger_count) if @flight_search.passenger_count.present?
    @flights = @flights.where(start_datetime: @flight_search.flight_date_datetime) if @flight_search.flight_date.present?
  end

  def show
    @flight = Flight.find(params[:id])
  end

  private

  def flight_search_params
    params.fetch(:flight_search, {}).permit(:departure_airport, :arrival_airport, :passenger_count, :flight_date)
  end
end
