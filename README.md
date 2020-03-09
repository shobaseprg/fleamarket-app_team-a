# README
# fleamarket-app_team-a

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false| 
|first_name_reading|string|null: false|
|family_name_reading|string|null: false|
|nickname|string|null: false|
|self_introduction|text||
|email|string|null: false|
|password|string|null: false|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|avatar|string||

### Association
-has_many :evaluations
-has_many :goods
-has_many :items, dependent: :destroy
-has_many :comments, dependent: :destroy
-has_many :payments, dependent: :destroy
-has_one :address, dependent: :destroy
-has_many :evaluation_notices,dependent: :destroy
-has_many :good_notices,dependent: :destroy
-has_many :comment_notices,dependent: :destroy
-has_many :buyed_item_notices,dependent: :destroy

---------------------------------------------------

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building|string||
|dery_postal_code|string|null: false|
|dery_prefectures|string|null: false|
|dery_address|string|null: false|
|dery_building|string||

### Association
-belongs_to :user

---------------------------------------------------

## users_transactsテーブル 
|Column|Type|Options|
|------|----|-------|
|item|references|foreign_key: true|
|transact_buyer_id|reference|foreign_key: true| 
|transact_saler_id|reference|foreign_key: true| 
|transact_comment|text||
|trans_status|integer| 

### Association
-belongs_to :item

----------------------------------------------------

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description_item|text|null: false|
|condition|integer|null: false|
|price|integer|null: false|
|sales_profit|integer|
|state|integer|null: false|
|category_id|reference|foreign_key: true,null: false|
|brand_id|reference|foreign_key: true|
|buyer_id|reference|foreign_key:true,default:0|
|saler_id|reference|foreign_key: true|
|evaluation_id|reference|foreign_key: true|

### Association
-has_many :item_images, dependent: :destroy
-has_many :goods
-has_many :comments
-belongs_to :buyer, class_name: “User”
-belongs_to :saller, class_name: “User”
-belongs_to :brand 
-belongs_to :category
-has_many :users_transacts, dependent: :destroy
-has_one :to_do, dependent: :destroy
-has_one :shipping, dependent: :destroy

------------------------------------------------------------

## shippingテーブル
|charges|string|null: false|
|date|datetime|null: false|
|Purchase|text||
|area|integer|null: false|

### Association
-belongs_to :item

----------------------------------------------------------

## item_imageテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|reference|foreign_key: true|
|image|string| 

### Association
-belongs_to :item 

-----------------------------------------------------------

## goodテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

### Association
-belongs_to :user 
-belongs_to :item

-----------------------------------------------------------

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true| 
|text|text||
|rank|integer|| 

### Association
-belongs_to :sayer, class_name: "User"
-belongs_to :receiver, class_name: "User"

------------------------------------------------------------

## brandテーブル
|Column|Type|Options|
|------|----|-------|
|brand_list|string||

### Association
-has_many :items

-------------------------------------------------------------

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|ancestry|string||

### Association
-has_many :items

-----------------------------------------------------------------

## to_doテーブル
|Column|Type|Options|
|------|----|-------|
|to_do_list|text||
|todo_status|integer| 
|item_id|reference|null: false, foreign_key: true| 

### Association
-belongs_to :item 

-------------------------------------------------------------------

## good_noticeテーブル
|Column|Type|Options|
|------|----|-------|
|good_id|reference|foreign_key: true| 

### Association
-belongs_to :user

--------------------------------------------------------------------

## comment_noticeテーブル
|Column|Type|Options|
|------|----|-------|
|comment_id|reference|foreign_key: true| 

### Association
-belongs_to :user

---------------------------------------------------------------------

## evaluations_noticeテーブル
|Column|Type|Options|
|------|----|-------|
|evaluations_id|reference|foreign_key: true| 

### Association
-belongs_to :user

--------------------------------------------------------------------

## buyed_item_noticeテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|reference|foreign_key: true| 

### Association
-belongs_to :user

--------------------------------------------------------------------

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|reference|null: false, foreign_key: true| 
|user_id|reference|null: false, foreign_key: true| 
|comment|text||

### Association
-belongs_to :user
-belongs_to :item

---------------------------------------------------------------------

## paymentテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true| 
|card_number|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|security_code|integer|null: false|

### Association
-belongs_to :user

