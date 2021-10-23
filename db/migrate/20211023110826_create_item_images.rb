class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|

      t.integer :item_id
      t.string :image_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
