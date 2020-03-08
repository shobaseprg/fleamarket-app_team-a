class CreateCommentNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_notices do |t|
      t.string :evaluations_notice
      t.string :buyed_item_notice
      t.string :comment
      t.string :payment

      t.timestamps
    end
  end
end
