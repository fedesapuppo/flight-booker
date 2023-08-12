class FlightsController < ApplicationController
  before_action :set_search_flag, only: :index

  def index
    @booking = Booking.new
    @flight_search = FlightSearch.new(flight_search_params)
    @flights = Flight.all
    @flights = Flight.filter_by_departure_airport(@flight_search.departure_airport) if @flight_search.departure_airport.present?
    @flights = Flight.filter_by_arrival_airport(@flight_search.arrival_airport) if @flight_search.arrival_airport.present?
    @flights = Flight.filter_by_date(@flight_search.flight_date_datetime) if @flight_search.flight_date.present?
  end

  def show
    @flight = Flight.find(params[:id])
  end

  private

  def flight_search_params
    params.fetch(:flight_search, {}).permit(:departure_airport, :arrival_airport, :passenger_count, :flight_date)
  end

  def set_search_flag
    @search_performed = params[:flight_search].present?
  end
end
