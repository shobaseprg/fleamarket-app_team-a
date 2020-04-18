class Card < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :Month
  belongs_to_active_hash :Year
end
