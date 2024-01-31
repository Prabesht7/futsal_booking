class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.datetime :start_time
      t.integer :hours
      t.datetime :total_time

      t.timestamps
    end
  end
end
