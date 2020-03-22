class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name ,null: false
      t.text :description_item ,null: false
      t.references :category, foreign_key: true ,null: false
      t.references :brand, foreign_key: true
      t.string :condition ,null: false
      t.string :shipping_charger ,null: false
      t.string :shipping_method ,null: false
      t.string :ship_from ,null: false
      t.string :shipping_days ,null: false
      t.integer :price ,null: false
      t.integer :sales_profit ,null: false
      t.references :buyer,foreign_key: #{ to_table: :users }
      t.references :seller,foreign_key: ,null: false #{ to_table: :users }
      t.references :evaluationforeign_key: true ,null: false
      t.timestamps
    end
  end
end
