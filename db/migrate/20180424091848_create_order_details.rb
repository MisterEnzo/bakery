class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.references :order, foreign_key: true
      t.references :menu_item, foreign_key: true
      t.integer :quantity
      t.integer :sub_total

      t.timestamps
    end
  end
end
