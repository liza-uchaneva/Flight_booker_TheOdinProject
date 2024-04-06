class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airport_options = Airport.all.order(:code).map{ |a| [a.code, a.id]}
    @number_of_seats = params[:number_of_seats]

    @flight_search_results = search_flights
  end
  
  def new
    @flight = Flight.new
  end 
  
  def search_flights
    return [] unless params[:departure_airport_id].present? && params[:arrival_airport_id].present?

    Flight.where(departure_airport_id: params[:departure_airport_id],
                arrival_airport_id: params[:arrival_airport_id])
          .where("DATE(start) = ?", params[:date])
  end
end
