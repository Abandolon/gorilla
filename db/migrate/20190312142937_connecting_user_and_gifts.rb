class ConnectingUserAndGifts < ActiveRecord::Migration[5.2]
  def change
  add_reference :bookings, :user_gifts, foreign_key: true
  end
end
