class ChangingDatabase < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bookings, :user_gifts
    add_reference :bookings, :gift, foreign_key: true
  end
end
