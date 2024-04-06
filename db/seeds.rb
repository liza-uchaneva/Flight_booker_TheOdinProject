# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
[["BUR", 1], ["FAT", 2], ["LAX", 3], ["LGB", 4], ["OAK", 5],
["ONT", 6], ["PSP", 7], ["SMF", 8], ["SAN", 9], ["SFO", 10], 
["SJC", 11], ["SNA", 12]].each do |air_code, air_id|
    Airport.find_or_create_by!(code: air_code, id:air_id)
end

flight_one = [1, 1, 2, DateTime.now + 10.days + 2.hours, 2.5]
fligh_two = [2, 3, 5, DateTime.now + 20.days + 47.minutes, 3.5]
flight_three = [3, 2, 4, DateTime.now + 30.days, 2.5]
fligh_four = [4, 4, 5, DateTime.now + 50.days, 2.5]
flight_five = [5, 1, 2, DateTime.now + 10.days + 47.minutes, 3.5]

flights = [flight_one, fligh_two, flight_three, fligh_four, flight_five]

flights.each do |array|
  Flight.find_or_create_by!(
    id: array[0],
    departure_airport_id: array[1],
    arrival_airport_id: array[2],
    start: array[3],
    duration: array[4]
  )
end