class MenuItem < ApplicationRecord
  has_many :order_details
  monetize :price_cents

end
