class Booking < ApplicationRecord
    belongs_to :flight
    belongs_to :user

    has_many :tickets

    accepts_nested_attributes_for :tickets
end
