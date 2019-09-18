class Gym < ApplicationRecord
  GYMS = ["High5 Gym", "JOHN REED Fitness", "FitX Fitnessstudio", "Fitbox", "McFit","Fitness First Berlin - Prenzlauer Berg", "Urban Sports Club"]
  mount_uploader :photo, PhotoUploader

  has_many :bookings
  has_many :users

  geocoded_by :address
  after_validation :geocode
end
