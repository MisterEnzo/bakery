class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.monetize :sub_total, currency: { present: false }
      t.references :menu_item, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
