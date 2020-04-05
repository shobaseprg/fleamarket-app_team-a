class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name ,null: false
      t.text :description_item ,null: false
      t.references :category, foreign_key: true
      t.integer :brand_id  #,null: false
      t.integer :condition_id #,null: false
      t.integer :shipping_charger_id #,null: false
      t.integer :shipping_method_id #,null: false
      t.integer :ship_from_id #,null: false
      t.integer :shipping_days_id #,null: false
      t.integer :price #,null: false
      t.integer :sales_fee #,null: false
      t.integer :sales_profit #,null: false
      t.references :seller ,foreign_key:{ to_table: :users } 
      t.references :buyer,foreign_key:{ to_table: :users }
      t.references :auction, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
