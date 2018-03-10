# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

<!-- 以下は仮実装のDB設計 -->

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|postcode|integer|
|address_main|string|
|address_sub|string|
|telephone_number|integer|

### Association
- has_many :orders
- has_many :carts, dependent: :destroy
- has_many :items, through: :carts

## cartsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|color_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|quantity|integer|null: false, default: 0|

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :color
- belongs_to :size

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
|name|string|null: false|
|description|text|null: false|
|shop_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|image_url|string|null: false|

### Association
- has_many :item_lists
- has_many :item_sub_images
- has_many :sub_images, through: :item_sub_images
- has_many :ordered_items
- has_many :orders, through: :ordered_items
- has_many :carts, through: :carts
- belongs_to :shop
- belongs_to :brand

## item_sub_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|sub_image_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :sub_image

## sub_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|color_id|references|null: false, foreign_key: true|
|img_url|string|null: false|

### Association
- has_one :item_sub_image
- belongs_to :color

## item_listsテーブル

|Column|Type|Option|
|------|----|------|
|item_id|references|null: false, foreign_key: true|
|color_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|stock|integer|null: false|

### Association
- belongs_to :item
- belongs_to :color
- belongs_to :size

## colorsテーブル

|Column|Type|Option|
|------|----|------|
|color|string|

### Association
- has_many :carts
- has_many :item_lists
- has_many :sub_images
- has_many :ordered_items

## sizesテーブル

|Column|Type|Option|
|------|----|------|
|size|string|

### Association
- has_many :carts
- has_many :item_lists
- has_many :ordered_items

## shopsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|

### Association
- has_many :items

## brandsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|

### Association
- has_many :items

##ordersテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|total_price|integer|null: false|
|status|integer|null: false|

### Association
- belongs_to :user
- has_many :ordered_items, dependent: :destroy
- has_many :items, through: :ordered_items

## ordered_itemsテーブル

|Column|Type|Option|
|------|----|------|
|order_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|color_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|quantity|integer|null: false|

### Association
- belongs_to :order
- belongs_to :item
- belongs_to :color
- belongs_to :size

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
