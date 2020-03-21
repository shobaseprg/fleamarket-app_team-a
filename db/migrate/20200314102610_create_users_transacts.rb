class CreateUsersTransacts < ActiveRecord::Migration[5.0]
  def change
    create_table :users_transacts do |t|
      t.references :item, null: false,foreign_key: true
      t.references :transact_buyer, null: false,foreign_key: { to_table: :users }
      t.references :transact_saler, null: false,foreign_key: { to_table: :users }
      t.text :transact_comment
      t.integer :trans_status
      t.timestamps
    end
  end
end

