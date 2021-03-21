class V1::PebbleController < ApplicationController

    

    def getPebbles
        begin
          @user = User.find_by(username: params.require(:username)) 
        rescue ActionController::ParameterMissing => e
            render_403(nil, "Parameter missing")
            return
        end

        if @user
            render_200 ( {
                 my_pebbles: getUserPebbles()
            } ) 
        end

    end


    def getUserPebbles
        pebbles = @user.pebbles
        ActiveModelSerializers::SerializableResource.new(pebbles, each_serializer: PebbleSerializer).as_json
    end

    
end
