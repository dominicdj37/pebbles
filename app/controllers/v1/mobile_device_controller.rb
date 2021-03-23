class V1::MobileDeviceController < ApplicationController

    skip_before_action :verify_authenticity_token

    def registerToken
        @user = getCurrentUser()
        render_403(nil, "Auth error") and return unless @user 

        begin
            params.require(:token) 
        rescue ActionController::ParameterMissing => e
            render_403(nil, "Token missing", { error_code_params: { error_type: "tocken_missing" } })
            return
        end

        existing =  @user.mobile_devices.find_by(fcm_tocken: params.require(:token))
        if existing
            render_200 (returnUserModel())  
            return
        end


        @mdevice = MobileDevice.new(fcm_tocken:  params.require(:token)) 

        begin
            @mdevice.save!
            @user.mobile_devices << @mdevice
            @user.save!
            render_200 (returnUserModel()) 
        rescue ActiveRecord::RecordInvalid => e
            render_403(error_message: e.message)
            return
        end

    end

    def deleteToken
        @user = getCurrentUser()
        render_403(nil, "Auth error") and return unless @user 

        begin
            params.require(:token) 
        rescue ActionController::ParameterMissing => e
            render_403(nil, "Token missing", { error_code_params: { error_type: "token_missing" } })
            return
        end

        begin
            mobileDevices =  @user.mobile_devices.where(fcm_tocken: params.require(:token))
            render_200 (returnUserModel())  and return unless mobileDevices.length > 0
    
            mobileDevices.destroy_all
            render_200 (returnUserModel()) 
        rescue ActiveRecord::RecordInvalid => e
            render_403(error_message: e.message)
            return
        end


    end

end
