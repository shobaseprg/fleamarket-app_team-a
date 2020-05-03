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
|email|string|null: false|
|phone_number|string|null: false|
|password|string|null: false|
|encrypted_password|string||
|birthday|date|null: false|

### Association
- has_many :saling_items, -> { where("seller_id is not NULL && buyer_id is NULL") }, class_name: "Item"
- has_many :auction_items, -> { where("seller_id is not NULL && auction_id is not NULL && buyer_id is NULL") }, class_name: "Item"
- has_many :sold_items, -> { where("seller_id is not NULL && buyer_id is not NULL && auction_id is NULL") }, class_name: "Item"
- has_many :evaluations
- has_many :goods
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :evaluation_notices,dependent: :destroy
- has_many :good_notices,dependent: :destroy
- has_many :comment_notices,dependent: :destroy
- has_many :buyed_item_notices,dependent: :destroy
- has_many :sns_credentials



---------------------------------------------------

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|address_first_name|string|null: false|
|address_family_name|string|null: false|
|building|string||
|block_number|string|null: false|
|user_id|integer|null: false|

### Association
- belongs_to :user

----------------------------------------------------

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description_item|text|null: false|
|category|reference|foreign_key: true,null: false|
|parent_category|reference|foreign_key: true,null: false|
|children_category|reference|foreign_key: true,null: false|
|brand_id|integer|null: false|
|condition_id|integer|null: false|
|shipping_charger_id|integer|null: false|
|shipping_method_id|integer|null: false|
|ship_from_id|integer|null: false|
|shipping_days_id|integer|null: false|
|price|integer|null: false|
|sales_fee|integer|null: false|
|sales_profit|integer|null: false|
|buyer|reference|foreign_key:true|
|saler|reference|null: false,foreign_key: true|
|auction|reference|foreign_key: true|

### Association
- belongs_to :category,class_name:"Category",optional: true,foreign_key: "category_id"
- belongs_to :parent_category,class_name:"Category",optional: true,foreign_key: "parent_category_id"
- belongs_to :children_category,class_name:"Category",optional: true,foreign_key: "children_category_id"
- belongs_to :seller, class_name: "User" , optional: true,foreign_key: "seller_id"
- belongs_to :buyer, class_name: "User", optional: true,foreign_key: "buyer_id"
- belongs_to :auction, class_name: "User", optional: true,foreign_key: "auction_id"
- has_many :item_images, dependent: :destroy
- has_many :comments, dependent: :destroy

----------------------------------------------------------

## item_imageテーブル
|Column|Type|Options|
|------|----|-------|
|item|reference|null: false,foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item 

-------------------------------------------------------------

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items

--------------------------------------------------------------------

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item|reference|null: false, foreign_key: true| 
|user|reference|null: false, foreign_key: true| 
|comment|string||

### Association
- belongs_to :user
- belongs_to :item

---------------------------------------------------------------------

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|| 
|customer_id|string||
|card_id|string||


### Association
- belongs_to :user

---------------------------------------------------------------------

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|| 
|uid|string||
|user|reference|null: false, foreign_key: true| 

### Association
- belongs_to :user, optional: true

---------------------------------------------------------------------

## good_noticeテーブル（実装予定）
|Column|Type|Options|
|------|----|-------|
|good|reference|null: false,foreign_key: true| 

### Association
- belongs_to :user

--------------------------------------------------------------------

## comment_noticeテーブル（実装予定）
|Column|Type|Options|
|------|----|-------|
|comment|reference|null: false,foreign_key: true| 

### Association
- belongs_to :user

---------------------------------------------------------------------

## evaluations_noticeテーブル（実装予定）
|Column|Type|Options|
|------|----|-------|
|evaluations|reference|null: false,foreign_key: true| 

### Association
- belongs_to :user

--------------------------------------------------------------------

## buyed_item_noticeテーブル（実装予定）
|Column|Type|Options|
|------|----|-------|
|item|reference|null: false,foreign_key: true| 

### Association
- belongs_to :user

-------------------------------------------------------------------

## to_doテーブル（実装予定）
|Column|Type|Options|
|------|----|-------|
|to_do_list|text||
|todo_status|integer|null: false|
|item|reference|null: false, foreign_key: true| 

### Association
- belongs_to :item 

-------------------------------------------------------------------

## goodテーブル(実装予定)
|Column|Type|Options|
|------|----|-------|
|item|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|

### Association
- belongs_to :user 
- belongs_to :item

-----------------------------------------------------------

## evaluationsテーブル（実装予定）
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false,foreign_key: true| 
|text|text||
|rank|integer|null: false|

### Association
- belongs_to :sayer, class_name: "User"
- belongs_to :receiver, class_name: "User"

-------------------------------------------------------------------