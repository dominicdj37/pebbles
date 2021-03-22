class CreatePebbleConnections < ActiveRecord::Migration[6.1]
  def change
    create_table :pebble_connections do |t|
      t.string :connection_type

      t.timestamps
    end
  end
end
