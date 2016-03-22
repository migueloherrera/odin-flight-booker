class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :departure_id
      t.integer :destination_id
      t.datetime :start_date
      t.integer :duration

      t.timestamps null: false
    end
  end
end
