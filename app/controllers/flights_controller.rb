class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [a.location, a.id]}
    @flight_dates = Flight.date_list
    @passenger_number = [1,2,3,4]
    #### Selected flight options ####
    @from_airport = params[:departure_id]
    @to_airport = params[:destination_id]
    @schedule = params[:start_date]
    @passengers = params[:passengers]
    @flights = Flight.search(params[:departure_id],
                             params[:destination_id],
                             params[:start_date])
  end
end
