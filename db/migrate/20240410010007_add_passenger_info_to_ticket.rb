class AddPassengerInfoToTicket < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :passenger_name, :string
    add_column :tickets, :passenger_email, :string
  end
end
