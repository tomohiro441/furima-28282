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

| Column               | Type   | Options     |
| --------             | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_name_reading    | string | null: false |
| first_name_reading   | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :order
- has_many :items


## items テーブル

| Column              | Type        | Options                       |
| --------            | ------      | ---------------               |
| name                | string      | null: false                   |
| info                | text        | null: false                   |
| price               | integer     | null: false                   |
| category_id         | integer     | null: false                   |
| delivery_fee_id     | integer     | null: false                   |
| prefecture_id       | integer     | null: false                   |
| delivery_date_id    | integer     | null: false                   |
| user                | references  | null: false ,foreign_key:true |


### Association

- belongs_to :users
- has_many   :order
- has_one    :shipping_address


## order テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items


##  shipping_addressテーブル

| Column            | Type       | Options     |
| -------           | ---------- | ------------|
| post_code         | integer    | null: false |
| prefecture_id     | integer    | null: false |
| city              | string     | null: false |
| house_number      | string     | null: false |
| building_number   | string     |             |
| phone_number      | integer    | null: false |

### Association

- belongs_to :items