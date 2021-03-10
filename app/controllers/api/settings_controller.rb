class Api::SettingsController < ApplicationController

    def getSettings
        render_200({
            app_name: "Pebbles",
            version: "1.0.0",
            firebase_api_key: "abcdxyz123!@#"
        })
    end

    
end
