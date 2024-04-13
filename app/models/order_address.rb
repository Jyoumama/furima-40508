class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

 #バリデーションの記述
    with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}, length: { is: 8 }

    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :addresses
    validates :phone_number, numericality: {only_integer: true, message: "is invalid.Input only number"},
                         format: {with: /\A\d{10,11}\z/,message: "Phone number is too short"}, length: { in: 10..11 }
    validates :token
    end

    def save
  # 各テーブルにデータを保存する処理を記述
    order = Order.create(item_id: item_id, user_id: user_id)
  # 住所を保存する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
    end
 end
