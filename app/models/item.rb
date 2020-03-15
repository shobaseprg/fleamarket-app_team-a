class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy 
  accepts_nested_attributes_for :item_images
  validates_associated :item_images
  validates :images, presence: true

  has_many :goods
  has_many :comments
  belongs_to :buyer, class_name: "User" 
  belongs_to :saller, class_name: "User"
  belongs_to :brand
  belongs_to :category
  has_many :users_transacts, dependent: :destroy 
  has_one :to_do, dependent: :destroy 
  has_one :shipping, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :description_item 
    validates :price
  end
end

