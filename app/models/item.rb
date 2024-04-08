class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  

  belongs_to :user
  has_one :order
  has_one_attached :image

#空の投稿を保存できないようにする
with_options presence: true do
validates :name, length: { maximum: 40 }
validates :detail, length: { maximum: 1000 }
validates :image
validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 0 , message: "can't be blank"}
 end
end