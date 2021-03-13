class PebbleConnection < ApplicationRecord
    belongs_to :user
    belongs_to :pebble
end
