class BookingsController < ApplicationController
  def new
    @flight = Flight.find_by(id: params[:booking][:flight_id])
    if @flight.nil?
      flash[:error] = "Flight not found"
      redirect_to flights_path
      return
    end

    @booking = Booking.new(flight: @flight, user: current_user)
  end

  def select_flight
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight, user: current_user)
    redirect_to new_booking_path
  end
end
