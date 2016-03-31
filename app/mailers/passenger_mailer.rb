class PassengerMailer < ApplicationMailer
  def thank_you(passenger)
    @passenger = passenger
    @from = @passenger.bookings.last.flight.from_airport.location
    @to = @passenger.bookings.last.flight.to_airport.location
    mail(to: @passenger.email, subject: "Thank you for choosing us!")
  end
end
