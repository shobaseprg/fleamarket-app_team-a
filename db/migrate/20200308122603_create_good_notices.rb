class CreateGoodNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :good_notices do |t|
      t.string :comment_notice
      t.string :evaluations_notice
      t.string :buyed_item_notice
      t.string :comment
      t.string :payment

      t.timestamps
    end
  end
end
