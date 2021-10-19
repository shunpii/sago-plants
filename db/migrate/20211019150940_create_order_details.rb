class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
