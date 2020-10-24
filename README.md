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
| birth_day         | date    | null: false |プルダウン
### Association

- has_many :items
- has_many :purchase_records




## items テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | -----------       |
| name               | string     | null: false       |40まで
| information        | text       | null: false       |1000まで
| category           | integer    | null: false       |プルダウン
| condition          | integer    | null: false       |プルダウン
| delivery_fee       | integer    | null: false       |プルダウン
| ship_from_location | integer    | null: false       |プルダウン
| delivery_start     | integer    | null: false       |プルダウン
| price              | integer    | null: false       |¥300〜9,999,999
| user               | references | foreign_key: true |



### Association

- belongs_to :user
- has_one    :purchase_record






## purchase_records テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |
| address     | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address





## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false,                   |
| prefecture         | string     | null: false,                   |プルダウン
| city               | string     | null: false,                   |
| block              | string     | null: false,                   |
| building           | string     |                                |
| phone_number       | string     | null: false,                   |
| purchase_record    | references | foreign_key: true              |

### Association

- belongs_to :purchase_record