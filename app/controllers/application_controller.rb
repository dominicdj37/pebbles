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

end
