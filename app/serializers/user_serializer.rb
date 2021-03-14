class UserSerializer < ApplicationSerializer
    attributes :username, :email 
    has_many :pebbles
end