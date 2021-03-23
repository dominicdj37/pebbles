class User < ApplicationRecord
    has_secure_password
    validates :username, :presence => true, :uniqueness => true

    has_many :pebble_connections
    has_many :pebbles, through: :pebble_connections
    has_many :mobile_devices
end
 