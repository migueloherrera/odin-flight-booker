class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport", foreign_key: :departure_id
  belongs_to :to_airport, class_name: "Airport", foreign_key: :destination_id
  has_many :bookings
  has_many :passengers, through: :passenger_bookings
  
  validates :departure_id, presence: true
  validates :destination_id, presence: true
  validates :start_date, presence: true
  validates :duration, presence: true    
  
  def self.date_list
		dates = Flight.all.order(start_date: :asc)
		dates.map {|n| n.start_date.strftime("%d/%m/%Y") }.uniq
	end  
	
	def self.search(depart, dest, date)
		Flight.where(departure_id: depart, 
					 destination_id: dest,
					 start_date: Flight.between(date))
	end
	# Searches all dates generating a BETWEEN clause starting at 00:00:00 and finishing at 23:59:99
	def self.between(date)
		unless date.nil?
			date = date.to_date
			date.beginning_of_day..date.end_of_day
		end
	end
end
