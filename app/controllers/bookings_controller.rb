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
      logger.info "new action"
      logger.info "#{@booking.passengers.size}"
    else
      redirect_to flights_path
    end
  end

  def create
    logger.info "it is rendered to crete!"
    @booking = Booking.new(passengers_params)
    logger.info "#{@booking.passengers.size}"
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
    if Booking.exists?(params[:id])
      logger.info "Booking is exist!"
      @booking = Booking.find(params[:id])    
      @passengers = @booking.passengers
    else
      redirect_to flights_path
    end
  end

  private
  def passengers_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end

  def booking_params
    params.require(:booking).permit(:flight_id, :user_id, passenger_attributes: [:id,:name, :email])  
  end
end
