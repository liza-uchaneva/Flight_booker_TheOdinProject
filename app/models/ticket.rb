class Ticket < ApplicationRecord
    belongs_to :booking

    validates :passenger_name, presence: true
    validates :passenger_email, presence: true
end
