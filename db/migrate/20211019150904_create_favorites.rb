class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

      t.integer :item_id
      t.integer :customer_id
      t.datetime :created_at
      t.datetime :updated_at


      t.timestamps
    end
  end
end
