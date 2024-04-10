class RemovePassengeridFromTicket < ActiveRecord::Migration[7.1]
  def change
    remove_column :tickets, :passenger_id, :integer 
  end
end
