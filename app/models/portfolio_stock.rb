class PortfolioStock < ApplicationRecord
    belongs_to :user
    validates :total_quantity, numericality {greater_than_or_equal_to: 0}
    include ApiAccessor

    def total_value
        self.access_quote.latest_price * self.total_quantity
    end

    def purge_zero_quantity_stock
        if self.total_quantity = 0
            self.destroy
        end
    end
end
