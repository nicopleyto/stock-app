class PortfolioStock < ApplicationRecord
    belongs_to :user

    include ApiAccessor

    #self.access_quote.latest_price returns nilclass, must refactor
    def total_value
        self.access_quote.latest_price * self.total_quantity
    end

    def purge_zero_quantity_stock
        #add code for deleting record if record has 0 quantity
    end
end
