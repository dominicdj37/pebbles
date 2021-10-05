class UserSerializer < ApplicationSerializer
    attributes :username, :email, :id 
    has_many :pebbles, if: -> { should_show_pebbles }
    has_many :mobile_devices

    def should_show_pebbles
        @instance_options[:show_pebbles]
    end


end