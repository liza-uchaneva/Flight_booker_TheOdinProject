class Passenger < ApplicationRecord
    has_many :tickets
    has_many :bookings, through: :tickets
    has_many :flights, through: :bookings, source: :flight

    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
