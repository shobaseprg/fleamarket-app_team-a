class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :brand_list, null: false
      t.timestamps
    end
  end
end
