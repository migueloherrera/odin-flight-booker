class PassengerBooking < ActiveRecord::Base
  belongs_to :passenger
  belongs_to :booking
  
  validates :booking_id, presence: true
  validates :passenger_id, presence: true
end
