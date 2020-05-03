class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :family_name
      t.string :first_name_reading
      t.string :family_name_reading
      t.string :nickname
      t.string :email, null: false, default: ""
      t.string :phone_number
      t.string :password, null: false, default: ""
      t.date :birthday, null: false
      t.string :encrypted_password

      t.text :self_introduction
      t.string :avatar

      # Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      # Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
