class AddNumPassengersToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :num_passengers, :integer
  end
end
