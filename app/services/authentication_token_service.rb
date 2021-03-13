class AuthenticationTokenService

    HMAC_SECRET = "49e64d1dd1f5bfb27c00ac1c7bf534b8f9a90f3f3cf72689b0f72f7e1607309aa8f54dbf7662fbb877bc6f7a5218baf67baebf4f7252c2cf63cf5b2baa2e1604"
    ALGORITH_TYPE = 'HS256'
    def self.call(user_id)
        hmac_secret = "mySecretKey1234"
        payload = {user_id: user_id}

        JWT.encode payload, HMAC_SECRET, ALGORITH_TYPE
    end
end