# Flight Booker

A flight search and booking app built with Ruby on Rails, part of the [The Odin Project](https://www.theodinproject.com/) Rails curriculum.

## Features

- Search flights by departure airport, arrival airport, date and number of passengers
- Book a flight for several passengers at once, entering each passenger's name and email in one form
- A confirmation email is sent to every passenger (Action Mailer)
- User accounts with **Devise**, plus a user page showing your bookings
- Seeded with 12 California airports

## What I practiced

- Self-referential associations: an `Airport` has `departing_flights` and `arriving_flights`
- `has_many :through` (users → bookings → tickets)
- Nested forms with `accepts_nested_attributes_for`
- GET search forms that filter with query params
- Sending mail from a controller action

## Tech stack

Ruby on Rails 7.1 · SQLite · Devise · Hotwire (Turbo + Stimulus) · Importmap · Action Mailer

## Running locally

Requires Ruby 3.2.2.

```bash
bundle install
bin/rails db:setup
bin/rails server
```

Then open http://localhost:3000.
