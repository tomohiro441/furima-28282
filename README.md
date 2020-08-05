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

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| name         | string | null: false |
| name_reading | string | null: false |
| birthday     | string | null: false |
### Association

- has_many :items_users
- has_many :items, through: items_users
- has_one :cards
- has_one :shipping_addres

## items テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| image           | string | null: false |
| item_name       | string | null: false |
| item_info       | text   | null: false |
| category        | string | null: false |
| item_condition  | string | null: false |
| shipping_fee    | string | null: false |
| shipping_region | text   | null: false |
| delivery_date   | string | null: false |
| price           | string | null: false |
| seller_id       | string | null: false |

### Association

- has_many :users_items
- belongs_to :users


## items_users テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| seller_id  | references | null: false, foreign_key: true |
| buyer_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

##  credit_cardsテーブル

| Column            | Type       | Options     |
| -------           | ---------- | ------------|
| creditcard_number | string     | null: false |
| card_expiration   | references | null: false |
| csv               | references | null: false |
| price             | references | null: false |

### Association

- belongs_to :user


##  shipping_adderesテーブル

| Column            | Type       | Options     |
| -------           | ---------- | ------------|
| post_code         | string     | null: false |
| prefecture        | string     | null: false |
| district          | string     | null: false |
| phone_number      | string     | null: false |

### Association

- belongs_to :user