class AddOwnerUserIdToPebble < ActiveRecord::Migration[6.1]
  def change
    add_column :pebbles, :owner_user_id, :Int
  end
end
