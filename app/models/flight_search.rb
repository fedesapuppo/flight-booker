class FlightSearch
  include ActiveModel::Model

  attr_accessor :departure_airport, :arrival_airport, :passenger_count, :flight_date

  def flight_date_datetime
    flight_date.to_datetime if flight_date.present?
  end
end
