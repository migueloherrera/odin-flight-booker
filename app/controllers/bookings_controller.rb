class BookingsController < ApplicationController
  def new
    if params[:flight_id].nil?
      flash[:danger] = "Flight not selected, please try again."
      redirect_to root_path
    else
      @flight = Flight.find(params[:flight_id])
      @booking = Booking.new
      @passengers = params[:passengers].to_i
      @passengers.times { @booking.passengers.build }
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
  
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      
      @booking.passengers.each do |passenger|
        PassengerMailer.thank_you(passenger).deliver  
      end
      
      flash[:success] = "Flight has been successfully booked"
      redirect_to booking_path(@booking)
    else
      flash.now[:danger] = "Error! Please check the information entered."
      @flight = Flight.find(params[:flight_id])
      render :new
    end
  end
  
  private
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
    end
end
