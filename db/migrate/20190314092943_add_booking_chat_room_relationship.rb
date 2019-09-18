class AddBookingChatRoomRelationship < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :chat_room, foreign_key: true
  end
end
