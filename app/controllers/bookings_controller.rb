class BookingsController < ApplicationController
    before_action :authenticate_user!

  def new
    if Flight.exists?(params[:selected_flight])
      @flight = Flight.find(params[:selected_flight])  
      @selected_flight = @flight.id
      @booking = Booking.new
      @number_of_seats = params[:number_of_seats].to_i
      @number_of_seats.times do
        @booking.passengers.build
      end
    else
      redirect_to flights_path
    end
  end

  def create
    logger.info "it is rendered to crete!"
    @booking = current_user.bookings.build(booking_params)
    @flight = Flight.find(@booking.flight_id)

    logger.info "it created booking and flight!"

    if @booking.save!
      logger.info "it is saved booking!"

      # @booking.passengers.each do |passenger|
      #   PassengerMailer.confirmation_email(@booking, passenger).deliver_now
      # end
      redirect_to booking_path(@booking)
    else
      logger.info "#{@booking.errors.full_messages}"
      logger.info "Booking was not successfully created"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    logger.info "It is in show method!"
    @booking = Booking.find(params[:id])
    if @booking.user != current_user
      redirect_to root_path
    end
  end

  private
  def passengers_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end

  def booking_params
    params.require(:booking).permit(:flight_id, :user_id, tickets_attributes: [passenger_attributes: [:id, :name, :email]])  
  end
end
