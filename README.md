# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|postcode|integer|
|address-1|string|
|address-2|string|
|tel_number|integer|

### Association
- has_many :orders
- has_many :carts, dependent: :destroy

## cartsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|color_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|quontity|integer|null: false, default: 0|

### Association
- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
|item_name|string|null: false|
|shop_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|image_url|string|

### Association
- has_many :item_lists

## items_listsテーブル
|Column|Type|Option|
|------|----|------|
|item_id|references|null: false, foreign_key: true|
|color_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|stock|integer|null: false|

### Association
- belongs_to :item

## colorsテーブル
|Column|Type|Option|
|------|----|------|
|color|string|

## sizesテーブル
|Column|Type|Option|
|------|----|------|
|size|string|

## shopsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|

## brandsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|

##ordersテーブル
|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|total_price|integer|null: false|
|status|integer|null: false|

### Association
- belongs_to :user
- has_many :ordered_items, dependent: :destroy

## ordered_itemsテーブル
|Column|Type|Option|
|------|----|------|
|order_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|color_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|quontity|integer|null: false|

### Association
- belongs_to :order, dependent: :destroy

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
