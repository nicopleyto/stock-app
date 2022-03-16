# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: Rails.application.credentials.admin_email, password: Rails.application.credentials.admin_password, password_confirmation: Rails.application.credentials.admin_password, role: 'admin')

#seed stocks database with default values
stocks_collection = ['AMZN', 'TSLA', 'AAPL', 'FB', 'MSFT', 'NVDA', 'BABA', 'GOOG', 'PYPL', 'NFLX', 'ABNB', 'UBER']

client = IEX::Api::Client.new(
    publishable_token: Rails.application.credentials.publishable_token,
    secret_token: Rails.application.credentials.secret_token,
    endpoint: 'https://cloud.iexapis.com/v1'
)

stocks_collection.each do |stock|
    Stock.create(symbol: stock, corp_name: client.company(stock).company_name, corp_description: client.company(stock).description)
end