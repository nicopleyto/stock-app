module ApiAccessor
    def access_quote
        initialize_client
        @client.quote(self.symbol)
    end

    private

    def initialize_client
        #token credentials can be found in config/initializers/iex_client.rb
        @client ||= IEX::Api::Client.new
    end
end