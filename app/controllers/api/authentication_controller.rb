class Api::AuthenticationController < ApplicationController

    class AuthenticationError < StandardError; end 

    skip_before_action :verify_authenticity_token
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    rescue_from AuthenticationError, with: :handle_unauthenticated

    def create 
       
        @user = User.find_by(username: params.require(:username))
        render_403(error_message: "Invalid username") and return unless @user

        if @user.authenticate(params.require(:password))
            token = AuthenticationTokenService.call(@user.id)
            render_200(returnUserModel())
        else 
            # raise AuthenticationError
            render_403(error_message: "Password do not match")
            return
        end
  
    end

    private

    def parameter_missing(e)
        render json: { error: e.message }, status: :unprocessable_entity
    end 

    def handle_unauthenticated
        render_403()
    end

    
end
