class PassengersController < ApplicationController
    def new
        @passenger = Passengers.new
    end

    def create
        @passenger = Passenger.create(passenger_params)
    end

    private
    def passenger_params
        params.permit(:name, :email, :booking_id)
    end
end
