class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.string :brand
      t.string :category
      t.string :to_do
      t.string :good_notice
      t.string :comment_notice
      t.string :evaluations_notice
      t.string :buyed_item_notice
      t.string :comment
      t.string :payment

      t.timestamps
    end
  end
end
