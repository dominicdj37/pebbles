class V1::PebbleController < ApplicationController

    skip_before_action :verify_authenticity_token
    before_action :authenticate_user
    rescue_from ActionController::ParameterMissing, :with => :render403

    def render403
        render_403(nil, "Parameter missing")
    end

    def getPebbles
        @user = getCurrentUser()
        if @user
            render_200 ( {
                 my_pebbles: getUserPebbles()
            } ) 
        end
    end

    def create

        @user = getCurrentUser()
        render_403(nil, "User not found") and return unless @user 

        @pebble = Pebble.new(
            pebble_key: params.require(:pebble_key),
            pebble_name: params.require(:pebble_name),
            owner_user_id: @user.id,
            status: "Inactive"
        )

        begin
            @pebble.save!
            @user.pebbles << @pebble
            @user.save!
            render_200 ( {
                my_pebbles: getUserPebbles()
            } ) 
        rescue ActiveRecord::RecordInvalid => e
            render_403(error_message: e.message)
            return
        end
    end


    def share
        @pebble = Pebble.find_by(id: params.require(:id)) 
        render_403(nil, "Pebble not found") and return unless @pebble 
        @user = User.find_by(username: params.require(:username)) 
        render_403(nil, "User not found") and return unless @user 


        begin

            # pebbleExist = @user.pebbles.find_by(id: params.require(:id)) 
            # render_403(nil, "User is already a pebble user") and return if pebbleExist

            @user.pebbles << @pebble
            @user.save!
            render_200 ( {
                my_pebbles: getUserPebbles()
            } ) 
        rescue ActiveRecord::RecordInvalid => e
            render_403(error_message: e.message)
            return
        end

    end

    def getUserPebbles
        @user = getCurrentUser()
        pebbles = @user.pebbles
        ActiveModelSerializers::SerializableResource.new(pebbles, each_serializer: PebbleSerializer).as_json
    end
    
end
