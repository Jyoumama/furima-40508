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
| item_name                    | string     | null: false                    |
| user                         | references | null: false, foreign_key: true |
| item_price                   | integer    | null: false                    |
| items_detail                 | text       | null: false                    |
| item_category_id             | integer    | null: false                    |
| item_sales_status_id         | integer    | null: false                    |
| item_shipping-_fee_status_id | integer    | null: false                    |
| item_prefecture_id           | integer    | null: false                    |
| item_scheduled_delivery_id   | integer    | null: false                    |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :items
- has_one    :address

## addresses テーブル名

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| postal_code_id     | string     | null: false                    |
| item_prefecture_id | string     | null: false                    |
| city_id            | references | null: false,foreign_key: true  |
| addresses_id       | string     | null: false                    |
| phone_number_id    | string     | null: false                    |

### Association
- belongs_to :order



