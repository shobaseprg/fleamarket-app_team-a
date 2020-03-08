class CreateEvaluationsNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations_notices do |t|
      t.string :buyed_item_notice
      t.string :comment
      t.string :payment

      t.timestamps
    end
  end
end
