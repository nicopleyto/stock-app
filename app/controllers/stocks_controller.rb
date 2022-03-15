#pluralize stocks controller and all associated files
#create stock model with symbol, company_name, company_description
#create method to populate model, store methods temporarily in seeds.rb (ask sir where to place the method and how to initialize client)
#edit the necessary controller methods

class StocksController < ApplicationController
  before_action :initialize_client

  def index
    @stocks = stocks_collection.map{|stock| @client.quote(stock)}
  end

  def show
    @stock = @client.quote("#{params[:symbol]}")
  end

  private

  def initialize_client
    @client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.publishable_token,
      secret_token: Rails.application.credentials.secret_token,
      endpoint: 'https://cloud.iexapis.com/v1'
    )
  end

  def stocks_collection
    ['AMZN', 'TSLA', 'AAPL', 'FB', 'MSFT', 'NVDA', 'BABA', 'GOOG', 'PYPL', 'NFLX', 'ABNB', 'UBER']
  end

end