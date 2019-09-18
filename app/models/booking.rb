class Booking < ApplicationRecord
  belongs_to :gym
  belongs_to :starter, class_name: "User"
  belongs_to :veteran, class_name: "User"
  belongs_to :gift, optional: true

  belongs_to :chat_room, optional: true

  validates :starter, :veteran, :date, :gym, presence: true
end
