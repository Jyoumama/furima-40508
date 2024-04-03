# README
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| profile            | text   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル


| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |
| category            | text       | null: false                    |
| order method        | references | null: false                    |
| cost                | text       | null: false                    |
| condition           | text       | null: false                    |
| ship from address   | string     | null: false                    |
| shipping fee        | text       | null: false                    |


### Association

- belongs_to :user
- has_one    :shipping_address


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :shipping_address

## shipping address テーブル名

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| address          | text       | null: false                    |
| shipping method  | references | null: false                    |
| item             | references | null: false, foreign_key: true |
| name             | references | null: false, foreign_key: true |


### Association
- belongs_to :item
- belongs_to :order



