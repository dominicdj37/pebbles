class FcmPushJob < ApplicationJob
  queue_as :default
  require 'fcm'

  def perform(tokens, title, message)

    fcm = FCM.new("AAAA2zfvQeE:APA91bF8OWgyW191fG0a8T4nVqwgm4-uY1lw3m5j3ar8KDbaHx0tTp4zbJl4eNPlADbX-RhPGbAdyH1g4uw91wOWC92H4cqbUe81fvaR80x-nGROXjws_lb6_VEjDWzajKcnwbiqVCnx")
        
    notificationId = Time.now.to_i

    # See https://firebase.google.com/docs/cloud-messaging/http-server-ref for all available options.
    options = { "data": {
                  "title": title,
                  "description": message,
                  "notification_mode": "new",
                  "notification_id": notificationId
              }
    }
    response = fcm.send(tokens, options)
    puts response 
  end
end
