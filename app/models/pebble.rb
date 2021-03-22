class Pebble < ApplicationRecord
    validates :pebble_key, :presence => true, :uniqueness => true
    validates :pebble_name, :presence => true, :uniqueness => true 
    has_many :pebble_connections
    has_many :users, through: :pebble_connections
end
