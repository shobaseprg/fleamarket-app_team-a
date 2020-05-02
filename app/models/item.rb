class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  validates :item_images, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :brand

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_charger

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_method
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :ship_from

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_days
  


  belongs_to :category,class_name:"Category",optional: true,foreign_key: "category_id"
  belongs_to :parent_category,class_name:"Category",optional: true,foreign_key: "parent_category_id"
  belongs_to :children_category,class_name:"Category",optional: true,foreign_key: "children_category_id"

  belongs_to :seller, class_name: "User" , optional: true,foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", optional: true,foreign_key: "buyer_id"
  belongs_to :auction, class_name: "User", optional: true,foreign_key: "auction_id"

  has_many :comments, dependent: :destroy


   with_options presence: true do
    validates :name
    validates :description_item 
    validates :price
    validates :category_id
    validates :children_category_id
    validates :parent_category_id
    validates :brand_id
    validates :condition_id
    validates :ship_from_id
    validates :shipping_charger_id
    validates :shipping_method_id
    validates :shipping_days_id
    validates :sales_fee
    validates :sales_profit
    validates :seller_id
   end

end

