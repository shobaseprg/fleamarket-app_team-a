class CreateGoodNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :good_notices do |t|
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
