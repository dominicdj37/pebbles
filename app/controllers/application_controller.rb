class ApplicationController < ActionController::Base


  
  def returnUserModel 
    UserSerializer.new(@user).as_json 
  end






  # region authentication ---------------------------------------------------------------------------------------------------------------------------

  def authenticate_user 
    token = cookies[:token]
    puts "token = #{token}"
        
    if token 
      user_id = AuthenticationTokenService.decode(token)
      if User.find(user_id)
        return
      end
    end
    
    render_401(nil, "You do not have permission to access this.")
  end

  

  # ------------------------------------------------------------------------------------------------------------------------------------------------



  # region errors -----------------------------------------------------------------------------------------------------------------------------------

    def render_200(result = true, sucess_code = nil)
        sucess_code = "Sucessfully completed request" if sucess_code.nil?

        respond_to do |format|
            format.json do
                render json:
                    {
                        result: result,
                        message: sucess_code
                    },
                    status: 200
            end
        end

    end

    def render_500(error_code = nil, error_message = nil)
        error_code = 'internal_server_error' if error_code.nil?
        respond_to do |format|
            format.json { render_json_error(500, error_code, error_message, nil) }
        end
    end


    def render_400(error_code = nil, error_message = nil)
        error_code = 'bad_request' if error_code.nil?
        respond_to do |format|
            format.json { render_json_error(400, error_code, error_message, nil) }
        end
    end

    def render_401(error_code = nil, error_message)
      error_code = 'unauthorized_access' if error_code.nil?
      respond_to do |format|
        format.json { render_json_error(401, error_code, error_message, nil) }
      end
    end

    def render_403(error_code, error_message = nil, options = {})

      error_code = 'forbidden' if error_code.nil?
      error_message = "You do not have permission to access this!" if error_message.nil?
      error_code_params = options && options.is_a?(Hash) && options[:error_code_params] ? options[:error_code_params] : nil

      respond_to do |format|
        format.json { render_json_error(403, error_code, error_message, error_code_params) }
      end
    end

    def render_422(error_code = nil, error_message)
      error_code = 'unprocessable_entity' if error_code.nil?
      respond_to do |format|
       format.json { render_json_error(422, error_code, error_message, nil) }
      end
    end

    def render_json_error(status_code, error_code, error_message = nil, error_code_params )

      response = {
        error: {
          code: status_code,
          error_type: error_code,
          message: error_message,
          error_code_params: error_code_params
        }
      }
  
      render json: response, status: status_code
    end
    # ------------------------------------------------------------------------------------------------------------------------------------------------


end
