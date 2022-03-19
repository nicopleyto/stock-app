class PortfolioStock < ApplicationRecord
    belongs_to :user

    include ApiAccessor
    end
end
