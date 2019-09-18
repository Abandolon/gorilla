class DeleteGiftIds < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :gift_id
    remove_column :bookings, :gift_id
  end
end
