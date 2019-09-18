class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :gym, optional: true
  has_many :bookings
  has_many :photos
  has_many :user_styles
  has_many :styles, through: :user_styles
  has_many :user_gifts
  has_many :gifts, through: :user_gifts

  has_many :bookings_as_starter, source: :bookings, foreign_key: :starter_id
  has_many :bookings_as_veteran, source: :bookings, foreign_key: :veteran_id

  has_many :messages, dependent: :destroy

  validates :name, :gender, :age, :description, presence: true
  validates :age, numericality: true, length: { maximum: 3 }
  validates :description, length: { maximum: 100 }
  validates :veteran, inclusion: { in: [true, false] }

  validates :pirate, inclusion: { in: [true, false] }
  validates :beach, inclusion: { in: [true, false] }
  validates :summer, inclusion: { in: [true, false] }
  validates :book, inclusion: { in: [true, false] }
  validates :vegetable, inclusion: { in: [true, false] }
  validates :bicycle, inclusion: { in: [true, false] }
  # commenting to add to pull request

  scope :veteran, -> { where(veteran: true) }
  scope :starter, -> { where(veteran: false)}
  scope :at_gym, ->(gym) { where(gym: gym) }
  scope :with_styles, ->(styles) { joins(:user_styles).where(user_styles: { style: styles}) }
end
