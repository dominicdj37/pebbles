class PebbleSerializer < ApplicationSerializer
    attributes :pebble_name
    has_many :users
end