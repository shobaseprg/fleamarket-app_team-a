class CreateShippngs < ActiveRecord::Migration[5.2]
  def change
    create_table :shippngs do |t|
      t.string :itemimage
      t.string :good
      t.string :evaluation
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
