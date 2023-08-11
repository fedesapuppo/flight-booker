class BookingsController < ApplicationController
  def new
    @flight = Flight.find_by(id: params[:booking][:flight_id])
    if @flight.nil?
      flash[:error] = "Flight not found"
      redirect_to flights_path
      return
    end

    @passenger_count = params[:booking][:num_passengers].to_i
    @booking = Booking.new(flight: @flight, user: current_user, num_passengers: @passenger_count)
  end
end
