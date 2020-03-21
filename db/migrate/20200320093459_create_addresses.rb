class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.string :prefectures, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :building
      t.string :dery_postal_code, null: false
      t.string :dery_prefectures, null: false
      t.string :dery_address, null: false
      t.string :dery_building
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
