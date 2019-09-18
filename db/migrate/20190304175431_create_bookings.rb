class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :gym, foreign_key: true
      t.date :date

      t.references :starter, foreign_key: { to_table: :users }
      t.references :veteran, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
