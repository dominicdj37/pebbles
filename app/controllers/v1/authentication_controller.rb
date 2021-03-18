class V1::AuthenticationController < ApplicationController

    class AuthenticationError < StandardError; end 

    skip_before_action :verify_authenticity_token
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    rescue_from AuthenticationError, with: :handle_unauthenticated

   
   
    def create 
       
        begin
            @user = User.find_by(username: params.require(:username))
        rescue ActionController::ParameterMissing => e
            render_403(nil, "Username missing", { error_code_params: { error_type: "empty_username" } })
            return
        end

        render_403(nil, "Invalid username", { error_code_params: { error_type: "invalid_username" } }) and return unless @user    
        

        begin
            if @user.authenticate(params.require(:password))
                token = AuthenticationTokenService.call(@user.id)
                puts "generated token: #{token}"
                cookies[:_shared_token_cookie] = token
                
                cookies.each do | cookie |
                    puts "each cookie: #{cookie}"
                end

                render_200(returnUserModel())
            else 
                # raise AuthenticationError
                render_403(nil, "Password do not match", { error_code_params: { error_type: "invalid_password" } })
                return
            end
            rescue ActionController::ParameterMissing => e
            render_403(nil, "Password missing", { error_code_params: { error_type: "empty_password" } })
            return
        end
  
    end


    def auto_login 
        cookies.each do |cookie|
            puts "each cookie: #{cookie}"
        end
        token = cookies[:_shared_token_cookie]
        puts "token received: #{token}"
        if token 
          user_id = AuthenticationTokenService.decode(token)

          @user = User.find(user_id)
          if @user 
            render_200(returnUserModel())
            return
          end
        end
        
        render_403(nil, "Please login to continue", { error_code_params: { error_type: "unauthorized_user" } })
        return
    end


    private

    def handle_unauthenticated
        render_403()
    end

    
end
