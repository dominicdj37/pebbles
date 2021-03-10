class ApplicationController < ActionController::Base


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

    def render_400(error_code = nil, error_message = nil)
        error_code = 'bad_request' if error_code.nil?
        respond_to do |format|
            format.json { render_json_error(400, error_code, error_message) }
        end
    end

    def render_401(error_code = nil, error_message)
        error_code = 'unauthorized_access' if error_code.nil?
        respond_to do |format|
          format.json { render_json_error(401, error_code, error_message) }
        end
      end

      def render_403(error_code = nil, error_message = nil)
        error_code = 'forbidden' if error_code.nil?
        respond_to do |format|
          format.json { render_json_error(403, error_code, error_message) }
        end
      end

    def render_json_error(status_code, error_code, error_message = nil)
      response = {
        error: {
          code: error_code,
          message: error_message
        }
      }
  
      render json: response, status: status_code
    end


end
