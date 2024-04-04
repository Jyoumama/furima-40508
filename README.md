# README
# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| first_name            | string  | null: false               |
| last_name             | string  | null: false               |
| first_name_kana       | string  | null: false               |
| last_name_kana        | string  | null: false               |
| birth_date            | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル


| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| item_lists                   | text       | null: false                    |
| item_info                    | text       | null: false                    |
| item_name                    | text       | null: false                    |
| seller                       | references | null: false, foreign_key: true |
| item_price                   | integer    | null: false                    |
| item_name_id                 | integer    | null: false                    |
| item_info_id                 | integer    | null: false                    |
| items_detail                 | text       | null: false                    |
| item_category_id             | integer    | null: false                    |
| item_sales_status_id         | integer    | null: false                    |
| item_shipping-_fee_status_id | integer    | null: false                    |
| item_prefecture_id           | integer    | null: false                    |
| item_scheduled_delivery_id   | integer    | null: false                    |
| item_price_id                | integer    | null: false                    |

### Association

- belongs_to :user
- has_one    :addresses


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| buyer     | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :items
- has_one    :addresses

## addresses テーブル名

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| price            | text       | null: false, foreign_key: true |
| shipping_address | string     | null: false                    |
| form             | string     | null: false                    |
| tel              | string     | null: false                    |


### Association
- belongs_to :order



