class ChatRoom < ApplicationRecord
  has_many :messages
  has_one :booking
end
