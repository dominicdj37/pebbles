class MyDevicesController < ApplicationController

    def index
    end 

    def new
        @device = Device.new
    end

    def create
        @device = Device.new(device_params)
        if @device.save
          puts "Device successfully created"
        else
          puts "Something went wrong"
        end
        redirect_to devices_path
    end
    

    private

    def device_params
      params.require(:device).permit(:device_name, :device_port, :device_type)
    end 

end
