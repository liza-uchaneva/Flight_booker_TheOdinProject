class TicketMailer < ApplicationMailer
  def confirmation_email(booking, ticket)
    @ticket = ticket
    @booking = booking
    @url = "localhost:3000/bookings/#{@booking.id}"
    mail(to: @ticket.passenger_email, subject: 'Welcome to Odin Flight Booker')
  end
end
