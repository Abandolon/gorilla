class Gift < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :user_gifts
  has_many :users, through: :user_gifts
  has_many :bookings

  validates :name, :time, presence: true
end
