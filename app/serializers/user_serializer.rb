class UserSerializer < ApplicationSerializer
    attributes :username, :email, :id 
    has_many :pebbles, if: -> { should_show_pebbles }

    def should_show_pebbles
        @instance_options[:show_pebbles]
    end


end