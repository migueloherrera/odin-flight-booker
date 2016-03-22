class Airport < ActiveRecord::Base
  has_many :departing_flights, class_name: "Flight", foreign_key: :departure_id
	has_many :arriving_flights, class_name: "Flight", foreign_key: :destination_id
	validates :code, presence: true
	validates :location, presence: true
end
