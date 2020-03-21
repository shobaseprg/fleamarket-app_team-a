class CreateShippings < ActiveRecord::Migration[5.0]
  def change
    create_table :shippings do |t|
      t.string :charges, null: false
      t.date :datetime, null: false
      t.text :Purchase
      t.integer :area, null: false
      t.references :item, null: false,foreign_key: true
      t.timestamps
    end
  end
end