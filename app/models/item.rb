class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  
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
  
  # validates_associated :item_images
  # validates :images, presence: true


  belongs_to :category,class_name:"Category",foreign_key: "category_id"
  belongs_to :parent_category,class_name:"Category",foreign_key: "parent_category_id"
  belongs_to :children_category,class_name:"Category",foreign_key: "children_category_id"
  # belongs_to :brand
  # has_many :goods
  # has_many :comments
  belongs_to :seller, class_name: "User" , optional: true,foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", optional: true,foreign_key: "buyer_id"
  belongs_to :auction, class_name: "User", optional: true,foreign_key: "auction_id"
  # has_many :users_transacts, dependent: :destroy 
  # has_one :to_do, dependent: :destroy 

   with_options presence: true do
     validates :name
     validates :description_item 
     validates :price
   end
end

