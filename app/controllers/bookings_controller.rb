class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    @passengers = params[:passengers].to_i
    @passengers.times { @booking.passengers.build }
  end

  def show
    @booking = Booking.find(params[:id])
  end
  
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
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
