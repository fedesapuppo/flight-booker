class CreateFlightsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :flights_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
