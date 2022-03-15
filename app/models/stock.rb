class Stock < ApplicationRecord
    def access_quote
        @client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.publishable_token,
            secret_token: Rails.application.credentials.secret_token,
            endpoint: 'https://cloud.iexapis.com/v1'
        )

        @client.quote(self.symbol)
    end
end
