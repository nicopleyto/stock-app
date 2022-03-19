class Transaction < ApplicationRecord
    belongs_to :user

    include ApiAccessor
end
