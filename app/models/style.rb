class Style < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  STYLES = ["Bodybuilding", "Cardio", "Powerlifting", "Crossfit", "Boxing", "Calisthenics"]

  has_many :user_styles
  has_many :users, through: :user_styles
end
