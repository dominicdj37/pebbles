class AddOwnerNameToPebble < ActiveRecord::Migration[6.1]
  def change
    add_column :pebbles, :status, :string
    add_column :pebbles, :up_time, :string
  end
end
