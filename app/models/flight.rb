class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport_id"
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport_id"

  has_many :flight_users
  has_many :users, through: :flight_users, class_name: "User"

  def self.filter_by_departure_airport(airport_id)
    where(departure_airport_id: airport_id)
  end

  def self.filter_by_arrival_airport(airport_id)
    where(arrival_airport_id: airport_id)
  end

  def self.filter_by_passangers(passanger_count)
    where(passanger_count: passanger_count)
  end

  def self.filter_by_date(date)
    where(start_datetime: date.beginning_of_day..date.end_of_day)
  end
end
