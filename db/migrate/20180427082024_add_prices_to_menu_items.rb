class AddPricesToMenuItems < ActiveRecord::Migration[5.1]
  def change
    add_monetize :menu_items, :price, currency: { present: false }

  end
end
