class RevertAddUserIdToFlights < ActiveRecord::Migration[7.0]
  def change
    remove_reference :flights, :user, foreign_key: true
  end
end
