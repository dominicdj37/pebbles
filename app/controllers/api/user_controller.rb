class Api::UserController < ApplicationController
    skip_before_action :verify_authenticity_token
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    rescue_from ActiveRecord::RecordNotUnique, :with => :my_rescue_method


    def create
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
            render_200(returnUserModel())
        else 
            render_500()
        end

    end

    
    def parameter_missing(e)
        render_403(error_message: "Please enter the required fields")
    end 

end