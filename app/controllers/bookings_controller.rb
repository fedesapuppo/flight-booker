class BookingsController < ApplicationController
  before_action :set_flight, only: [:new, :create]

  def new
    @passenger_count = params[:booking][:num_passengers].to_i || 1
    @booking = Booking.new(flight: @flight, user: current_user, num_passengers: @passenger_count)
    @booking.user = current_user
    @passenger = @booking.num_passengers.to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flight = @flight
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def set_flight
    @flight = Flight.find_by(id: params[:booking][:flight_id])
    if @flight.nil?
      flash[:error] = "Flight not found"
      redirect_to flights_path
    end
  end

  def booking_params
    params.require(:booking).permit(:flight_id, :num_passengers, passengers_attributes: [:name, :email])
  end
end
