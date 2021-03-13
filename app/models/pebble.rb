class Pebble < ApplicationRecord

    has_many :pebble_connections
    has_many :users, through: :pebble_connections
end
