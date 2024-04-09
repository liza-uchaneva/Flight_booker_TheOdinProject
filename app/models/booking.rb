class Booking < ApplicationRecord
    belongs_to :flight
    belongs_to :user

    has_many :tickets, inverse_of: :booking
    has_many :passengers, through: :tickets, source: :passenger

    accepts_nested_attributes_for :tickets
end
