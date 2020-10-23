# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| nickname          | string  | null: false |
| email             | string  | null: false |
| password          | string  | null: false |
| first_name        | string  | null: false |
| last_name         | string  | null: false |
| first_name_kana   | string  | null: false |
| last_name_kana    | string  | null: false |
| birth_day         | integer | null: false |プルダウン
### Association

- has_many :items
- has_many :purchase_records
- has_many :addresses 




## items テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | -----------       |
| item_name          | string     | null: false       |40まで
| item_inf           | text       | null: false       |1000まで
| item_category      | string     | null: false       |プルダウン
| item_condition     | string     | null: false       |プルダウン
| delivery_fee       | string     | null: false       |プルダウン
| ship_from_location | string     | null: false       |プルダウン
| delivery_start     | string     | null: false       |プルダウン
| price              | integer    | null: false       |¥300〜9,999,999
| user_id            | references | foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchase_record






## purchase_records テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user_id     | references | foreign_key: true |
| item_id     | references | foreign_key: true |
| address_id  | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address





## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | integer    | null: false,                   |
| prefecture         | string     | null: false,                   |プルダウン
| city               | string     | null: false,                   |
| block              | string     | null: false,                   |
| building           | string     |                                |
| phone_number       | integer    | null: false,                   |
| user_id            | references | foreign_key: true              |
| purchase_record_id | references | foreign_key: true              |

### Association

- belongs_to :purchase_record
- belongs_to :user 