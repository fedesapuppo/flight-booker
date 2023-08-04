class AddUserIdToFlights < ActiveRecord::Migration[7.0]
  def change
    add_reference :flights, :user, null: true, default: nil, foreign_key: true
  end
end
