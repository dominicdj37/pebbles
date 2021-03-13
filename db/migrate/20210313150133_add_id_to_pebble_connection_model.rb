class AddIdToPebbleConnectionModel < ActiveRecord::Migration[6.1]
  def change
    add_column :pebble_connections, :pebble_id, :integer
    add_column :pebble_connections, :user_id, :integer
  end
end
