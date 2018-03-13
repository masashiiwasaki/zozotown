# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|points|integer|default: 0|

### Association
- has_many :orders
- has_many :address_lists, dependent: :destroy
- has_many :carts, dependent: :destroy
- has_many :cart_records
- has_many :item_lists, through: :carts
- has_many :favorite_items, dependent: :destroy
- has_many :favorite_shops, dependent: :destroy
- has_many :favorite_brands, dependent: :destroy

## address_listsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|postcode|integer|null: false|
|address_main|string|null: false|
|address_sub|string|
|telephone_number|integer|null: false|
|default_flag|integer|

- belongs_to :user
- has_many :orders

## cartsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_list_id|references|null: false, foreign_key: true|
|quantity|integer|null: false, default: 0|

### Association
- belongs_to :user
- belongs_to :item_list
- has_many :items, through :item_lists

## cart_recordsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_list_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item_list
- has_many :items, through :item_lists

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|shop_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|regular_price|integer|null: false|
|proposed_price|integer|null: false|
|point_get|integer|null: false, default: 0|
|description|text|
|gender_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|material|string|
|made_in|string|
|shipping_fee|integer|null: false, default: 200|
|shipping_option|integer|null: false, default: 0|
|lapping_option|integer|null: false, default: 0|
|ident_code|integer|

### Association
- has_many :item_lists
- has_many :images
- has_many :ordered_items
- has_many :dimentions
- has_many :carts, through :item_lists
- has_many :cart_records, through :item_lists
- has_many :favorite_items, through :item_lists
- belongs_to :shop
- belongs_to :brand
- belongs_to :gender
- belongs_to :category

## item_listsテーブル

|Column|Type|Option|
|------|----|------|
|item_id|references|null: false, foreign_key: true|
|color_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|stock|integer|null: false|

### Association
- belongs_to :item
- belongs_to :size
- belongs_to :color
- has_many :carts
- has_many :cart_records
- has_many :favorite_items
- has_many :users, through: :carts

## sizesテーブル

|Column|Type|Option|
|------|----|------|
|size|string|

### Association
- has_many :item_lists
- has_many :dimensions

## colorsテーブル

|Column|Type|Option|
|------|----|------|
|color|string|

### Association
- has_many :item_lists
- has_many :images

## shopsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|

### Association
- has_many :items
- has_many :favorite_shops

## brandsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|

### Association
- has_many :items
- has_many :favorite_brands

## categoriesテーブル

|Column|Type|Option|
|------|----|------|
|main|string|
|sub|string|

### Association
- has_many :items

## gendersテーブル

|Column|Type|Option|
|------|----|------|
|gender|string|

### Association
- has_many :items

## demensionsテーブル

|Column|Type|Option|
|------|----|------|
|item_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|shoulder_width|integer|
|body_width|integer|
|arm_length|integer|
|weight|integer|
|waist|integer|
|rise|integer|
|inseam|integer|
|hem|integer|
|thigh|integer|
|hip|integer|

### Association
- belongs_to :item_list
- belongs_to :size

##favorite_itemsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|item_list_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item_list

##favorite_shopsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|shop_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :shop

##favorite_brandsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :brand

##ordersテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|address_list_id|references|null: false, foreign_key: true|
|shipment_id|references|null: false, foreign_key: true|
|shipping_schedule|datetime|
|payment_id|references|null: false, foreign_key: true|
|point_used|integer|null: false, default: 0|
|point_get|integer|null: false|
|total_price|integer|null: false|

### Association
- belongs_to :user
- belongs_to :address_list
- belongs_to :shipment
- belongs_to :payment
- has_one :order_history

##order_historiesテーブル

|Column|Type|Option|
|------|----|------|
|order_id|references|null: false, foreign_key: true|
|shipping_status_id|references|null: false, foreign_key: true|
|order_date|datetime|
|shipping_schedule|datetime|
|shipped_date|date|

### Association
- belongs_to :order
- belongs_to :shipping_status
- has_many :ordered_items

## ordered_itemsテーブル

|Column|Type|Option|
|------|----|------|
|ordered_history_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|item_name|string|null: flase|
|shop_name|string|null: flase|
|color|string|null: flase|
|size|string|null: flase|
|regular_price|integer|null: false|
|quantity|integer|null: false|

### Association
- belongs_to :order_history
- belongs_to :item

## paymentsテーブル

|Column|Type|Option|
|------|----|------|
|method|string|null: flase|
|fee|integer|null: false|

### Association
- has_many :orders

## shipmentsテーブル

|Column|Type|Option|
|------|----|------|
|method|string|null: flase|
|fee|integer|null: false|

### Association
- has_many :orders

## shipment_statusテーブル

|Column|Type|Option|
|------|----|------|
|status|string|null: flase|

### Association
- has_many :order_histories
