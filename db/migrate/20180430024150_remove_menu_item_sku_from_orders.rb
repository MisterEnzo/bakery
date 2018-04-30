class RemoveMenuItemSkuFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :menu_item_sku, :string
  end
end
