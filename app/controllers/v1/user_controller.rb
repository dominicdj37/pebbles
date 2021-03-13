class V1::UserController < ApplicationController
    
    skip_before_action :verify_authenticity_token
    rescue_from ActiveRecord::RecordNotUnique, :with => :my_rescue_method

    def create

        begin
            params.require(:username) 
        rescue ActionController::ParameterMissing => e
            render_403(nil, "Username missing", { error_code_params: { error_type: "empty_username" } })
            return
        end

        userExist = User.find_by(username: params.require(:username)) 
        if userExist 
            render_403(nil, "Username exist", { error_code_params: { error_type: "username_taken" } })
            return
        end

        begin
            params.require(:email) 
        rescue ActionController::ParameterMissing => e
            render_403(nil, "Username missing", { error_code_params: { error_type: "empty_email" } })
            return
        end

        begin
            params.require(:password) 
        rescue ActionController::ParameterMissing => e
            render_403(nil, "Username missing", { error_code_params: { error_type: "empty_password" } })
            return
        end

        userExist = User.find_by(username: params.require(:username)) 
        if userExist 
            render_403(nil, "Username exist", { error_code_params: { error_type: "username_taken" } })
            return
        end

        @user = User.new(
            username: params.require(:username),
            email: params.require(:email),
            password: params.require(:password)
        )

        begin
            @user.save!
        rescue ActiveRecord::RecordInvalid => e
            render_403(error_message: e.message)
            return
        end


        if @user 
            puts "temperature Port value: " + FIREBASE_DB.getPortValue("D5").to_s
            render_200(returnUserModel())
        else 
            render_500()
        end

    end

    
    def parameter_missing(e)
        render_403(error_message: "Please enter the required fields")
    end 

end