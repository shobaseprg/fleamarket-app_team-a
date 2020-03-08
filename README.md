# README
# fleamarket-app_team-a

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false| 
|katakana_first_name|string|null: false|
|katakana_family_name|string|null: false|
|nickname|string|null: false|
|self_introduction|text||
|email|string|null: false|
|password|string|null: false|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|postal_code|string|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building|string||
|dery_postal_code|string|null: false|
|dery_prefectures|string|null: false|
|dery_address|string|null: false|
|dery_building|string||
|icon|string||
|notice_id|integer|foreign_key: true| 

### Association
-has_many :evaluations
-has_many :goods
-has_many :items
-has_many :comments
-has_many :payments


## users_transactsテーブル 
|Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key: true|
|transact_buyer_id|integer|foreign_key: true| 
|transact_saler_id|integer|foreign_key: true| 
|transact_comment|text||
|trans_status|integer| 

### Association
-belong_to :item



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|description_item|text|null: false|
|item_state|string|null: false|
|price|integer|null: false|
|sales_profit|integer||
|category_id|integer||
|brand_id|integer|foreign_key: true|
|buyer_id|integer|foreign_key:true,default:0|
|saler_id|integer|foreign_key: true|
|shipping_charges|string|null: false|
|shipping_date|datetime|null: false|
|shipping_Purchase|text||
|shipping_area|integer|null: false|

### Association
-has_many :items_images
-has_many :goods
-has_many :comments
-belong_to :buyer, class_name: “User”
-belong_to :saler, class_name: “User”
-belong_to :brand 
-belong_to :category
-has_one :evaluation 
-has_many :users_transacts
-has_one :to-do


## item_imageテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key: true|
|file_name|string||
|image|string| 

### Association
-belong_to :item 



## goodテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
-belong_to :user 
-belong_to :item



## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true| 
|text|text||
|rank|integer|| 

### Association
-belong_to :sayer, class_name: "User"
-belong_to :receiver, class_name: "User"
-belong_to :item



## brandテーブル
|Column|Type|Options|
|------|----|-------|
|brand_list|string||

### Association
-has_many :items




## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|caregory_list1|string||
|caregory_list2|string||
|caregory_list3|string||

### Association
-has_many :items



## to-doテーブル
|Column|Type|Options|
|------|----|-------|
|to-do_list|text||
|todo_status|integer| 
|item_id|integer|null: false, foreign_key: true| 

### Association
-belong_to :item 


## noticeテーブル
|Column|Type|Options|
|------|----|-------|
|notice_list|text||

### Association
-has_many :users



## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true| 
|user_id|integer|null: false, foreign_key: true| 
|item_comment|text||

### Association
-belong_to :user
-belong_to :item



## paymentテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true| 
|card_number|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|security_code|integer|null: false|

### Association
-belong_to :user

