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
### Association

- has_many :order
- has_many :items
- has_one :shipping_address

## items テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| image      | string | null: false |
| name       | string | null: false |
| info       | text   | null: false |
| price      | string | null: false |
| user_id    | string | null: false |

### Association

- belongs_to :user


## order テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- has_one :shipping_address

##  shipping_addressテーブル

| Column            | Type       | Options     |
| -------           | ---------- | ------------|
| post_code         | string     | null: false |
| prefecture        | string     | null: false |
| city              | string     | null: false |
| house_number      | string     | null: false |
| building_number   | string     | null: false |
| phone_number      | string     | null: false |

### Association

- belongs_to :user
- belongs_to :order