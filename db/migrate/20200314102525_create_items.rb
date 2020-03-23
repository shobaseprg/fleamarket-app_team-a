class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name ,null: false
      t.text :description_item ,null: false
      t.references :category, null: false, foreign_key: true
      t.references :brand , foreign_key: true
      t.string :condition ,null: false
      t.string :shipping_charger ,null: false
      t.string :shipping_method ,null: false
      t.string :ship_from ,null: false
      t.string :shipping_days ,null: false
      t.integer :price ,null: false
      t.integer :sales_profit ,null: false
      t.references :buyer,foreign_key:{ to_table: :users }
      t.references :seller ,null: false,foreign_key:{ to_table: :users } 
      t.timestamps
    end
  end
end
