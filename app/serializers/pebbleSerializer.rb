class PebbleSerializer < ApplicationSerializer
    attributes :pebble_name, :status, :up_time, :owner_user_id, :id 
    has_many :users


    
    # def owner 
    #    self.instance_options[:owner]
    # end


    # todo remove after statusUpdate
    def status
        object.status ||= "Inactive"
    end

end