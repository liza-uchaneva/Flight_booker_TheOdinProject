class Ticket < ApplicationRecord
    belongs_to :passenger
    belongs_to :booking

    accepts_nested_attributes_for :passenger
end
