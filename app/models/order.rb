class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details


  validates :postal_code, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  validates :payment_method, inclusion: {in: [0, 1]}
  validates :address, inclusion: {in: [0, 1, 2]}

  enum payment_method: {
    クレジットカード: 0,
    銀行振込: 1
  }

  enum status: {
    入金待ち: 0,
    入金確認: 1,
    発送準備中: 2,
    発送済: 3
  }

end
