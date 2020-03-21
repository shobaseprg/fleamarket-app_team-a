class CreateBuyedItemNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :buyed_item_notices do |t|
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
