# README
# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| password_confirmation | string  | null: false               |
| first_name            | string  | null: false               |
| last_name             | string  | null: false               |
| birth_date            | integer | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル


| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | references | null: false                    |
| user                | references | null: false, foreign_key: true |
| postage             | text       | null: false                    |
| price               | integer    | null: false                    |



### Association

- belongs_to :user
- has_one    :shipping_address


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :orders
- has_one    :addresses

## addresses テーブル名

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| item             | text       | null: false, foreign_key: true |
| price            | text       | null: false, foreign_key: true |
| payment          | integer    | null: false                    |
| shipping address | text       | null: false                    |
| form             | text       | null: false                    |
| tel              | integer    | null: false                    |


### Association
- belongs_to :order



