class FlightUser < ApplicationRecord
  self.table_name = "flights_users"
  belongs_to :user
  belongs_to :flight
end
