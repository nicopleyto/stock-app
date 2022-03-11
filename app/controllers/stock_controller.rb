class StockController < ApplicationController
  before_action :initialize_client

  def index
    @quote = @client.quote('MSFT')
  end

  private

  def initialize_client
    @client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.publishable_token,
      secret_token: Rails.application.credentials.secret_token,
      endpoint: 'https://cloud.iexapis.com/v1'
    )
  end

end