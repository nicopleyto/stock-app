class PortfolioStock < ApplicationRecord
    belongs_to :user

    include ApiAccessor

    def total_value
        self.access_quote.latest_price * self.total_quantity
    end
end
