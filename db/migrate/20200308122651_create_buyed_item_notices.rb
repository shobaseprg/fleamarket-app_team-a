class CreateBuyedItemNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :buyed_item_notices do |t|
      t.string :comment
      t.string :payment

      t.timestamps
    end
  end
end
