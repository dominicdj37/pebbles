class CreatePebbles < ActiveRecord::Migration[6.1]
  def change
    create_table :pebbles do |t|
      t.string :pebble_key
      t.string :pebble_name

      t.timestamps
    end
  end
end
