class Ticket < ApplicationRecord
    belongs_to :passenger, class_name: "Passenger", primary_key: :passenger_id
    belongs_to :booking, class_name: "Booking", primary_key: :booking_id

    accepts_nested_attributes_for :passenger
end
