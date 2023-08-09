class Booking < ApplicationRecord
  self.table_name = "bookings"
  belongs_to :user
  belongs_to :flight
end
