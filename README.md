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
| birth_day         | integer | null: false |
### Association

- has_many :items
- has_many :purchase_records
- has_many :addresses




## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item_name          | string     | null: false |40まで
| price              | integer    | null: false |¥300〜9,999,999
| item_inf           | text       | null: false |1000まで

| user_id            | references | null: false |
| item_category      |            | null: false |プルダウン
| item_condition     |            | null: false |プルダウン
| delivery_fee       |            | null: false |プルダウン
| ship-from location |            | null: false |プルダウン
| delivery_period    |            | null: false |プルダウン



### Association

- belongs_to :user
- has_one    :purchase_record






## purchase_records テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |
| address_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address





## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | integer    |                                |
| prefecture         | string     | null: false, foreign_key: true |
| city               | string     | null: false, foreign_key: true |
| block              | string     |                                |
| building           | string     | null: false, foreign_key: true |
| phone_number       | integer    | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |
| purchase_record_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase_record