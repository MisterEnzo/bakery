class OrderDetail < ApplicationRecord
  belongs_to :menu_item
  belongs_to :order
  monetize :sub_total_cents
end
