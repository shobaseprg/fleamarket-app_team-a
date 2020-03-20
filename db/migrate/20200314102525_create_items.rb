class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description_item, null: false
      t.integer :condition, null: false
      t.integer :price, null: false
      t.integer :sales_profit
      t.integer :state, null: false
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :buyer, foreign_key: { to_table: :users }, default:0 
      t.references :saler, null: false, foreign_key: { to_table: :users }
      t.references :evaluation, null: false, foreign_key: true
      t.timestamps
    end
  end
end