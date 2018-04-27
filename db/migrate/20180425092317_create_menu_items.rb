class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.string :sku
      t.string :name
      t.string :description
      t.string :photo_url

      t.timestamps
    end
  end
end
