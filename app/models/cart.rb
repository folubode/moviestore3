class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :movie, inverse_of: :carts
end

