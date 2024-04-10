class Item < ApplicationRecord
  def sold_out?
    # ここでは商品に紐づく購入情報が存在するかどうかを判断しています。存在すれば商品は売り切れ、存在しなければ出品中とみなします。
    # purchaseはここでは仮の表現です。実際のコードでは関連する購入情報へのアクセス方法が適用されるべきです。
    !self.order.present?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  belongs_to :user
  has_one :order # 購入機能実装時の差分 
  has_one_attached :image

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :detail, length: { maximum: 1000 }
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
  end
end
