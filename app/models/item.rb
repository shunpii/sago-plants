class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  has_many :favorite
  has_many :item_images, dependent: :destroy
  accepts_attachments_for :item_images, attachment: :image

  validates :name, presence: true
  validates :size_height, presence: true
  validates :size_width, presence: true
  validates :introduction, presence: true
  validates :shipping_method, presence: true
  validates :price, presence: true

end
