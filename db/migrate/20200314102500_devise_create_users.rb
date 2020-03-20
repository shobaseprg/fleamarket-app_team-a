# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :first_name, null: false
      t.string :family_name, null: false
      t.string :first_name_reading, null: false
      t.string :family_name_reading, null: false
      t.string :nickname, null: false
      t.string :self_introduction, null: false
      t.string :email, null: false, default: ""
      t.string :phone_number, null: false, default: ""
      t.string :password, null: false, default: ""
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day, null: false
      t.string :avatar

      # t.string :encrypted_password, null: false, default: ""
      # t.string :encrypted_password, null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      # t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
