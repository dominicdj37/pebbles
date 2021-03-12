class V1::AuthenticationController < ApplicationController

    class AuthenticationError < StandardError; end 

    skip_before_action :verify_authenticity_token
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    rescue_from AuthenticationError, with: :handle_unauthenticated

    def create 
       
        @user = User.find_by(username: params.require(:username))
        render_403(nil, "Invalid username", { error_code_params: { error_type: "invalid_username" } }) and return unless @user

        if @user.authenticate(params.require(:password))
            token = AuthenticationTokenService.call(@user.id)
            render_200(returnUserModel())
        else 
            # raise AuthenticationError
            render_403(nil, "Password do not match", { error_code_params: { error_type: "invalid_password" } })
            return
        end
  
    end

    private

    def parameter_missing(e)
        render_422(nil, "Parameter(s) missing")
    end 

    def handle_unauthenticated
        render_403()
    end

    
end
