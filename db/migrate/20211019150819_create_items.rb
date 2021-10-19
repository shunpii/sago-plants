class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string :name
      t.string :image_id
      t.string :size_height
      t.string :size_width
      t.text :introduction
      t.string :shipping_method
      t.integer :price
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
