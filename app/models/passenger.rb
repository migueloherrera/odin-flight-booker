class Passenger < ActiveRecord::Base
  has_many :bookings, through: :passenger_bookings
  has_many :passenger_bookings
  has_many :flights, through: :bookings
  
  validates :name, presence: true
  validates :email, presence: true
end
