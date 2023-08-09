class RenameFlightUsersToBookings < ActiveRecord::Migration[7.0]
  def change
    rename_table :flights_users, :bookings
  end
end
