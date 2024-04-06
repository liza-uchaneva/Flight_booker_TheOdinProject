class Booking < ApplicationRecord
    belongs_to :flight
    belongs_to :user

    has_many :tickets, inverse_of: :booking, foreign_key: :ticket_id
    has_many :passengers, through: :tickets, source: :passenger

    accepts_nested_attributes_for :passengers
end
