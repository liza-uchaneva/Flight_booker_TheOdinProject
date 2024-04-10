class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: "Airport"
    belongs_to :arrival_airport, class_name: "Airport"

    has_many :bookings
    has_many :tickets, through: :bookings, source: :tickets

    validates :start, :duration, presence: true

    def formatted_date(date)
        date.strftime("%B %d, %Y")
    end
    
    def formatted_time(time)
        time.strftime("at %I:%M%p") 
    end

    def flight_detail
        "From: #{departure_airport.code} Departs at: #{start.strftime("%H:%M %d/%m/%Y")} 
        To: #{arrival_airport.code} Arrival time: #{(start + duration.hours).strftime("%H:%M %d/%m/%Y")} 
        Travel time: #{duration}"
    end
end
