# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      # -------------------------------------------------------コメントアウトした　うえやま
      ## Database authenticatable
      # t.string :first_name, null: false
      # t.string :family_name, null: false
      # t.string :first_name_reading, null: false
      # t.string :family_name_reading, null: false
      # t.string :nickname, null: false
      # t.text :self_introduction
      # t.string :email, null: false, default: ""
      # t.string :phone_number, null: false, default: ""
      # t.string :password, null: false, default: ""
      # t.integer :year, null: false
      # t.integer :month, null: false
      # t.integer :day, null: false
      # t.string :avatar
      # ---------------------------------------------------------

      # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー追記した
      t.string :first_name
      t.string :family_name
      t.string :first_name_reading
      t.string :family_name_reading
      t.string :nickname
      t.text :self_introduction
      t.string :email, null: false, default: ""
      t.string :phone_number
      t.string :password, null: false, default: ""
      t.integer :year
      t.integer :month
      t.integer :day
      t.string :avatar
      # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

      # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーコメントアウトをはずした
      t.string :encrypted_password, null: false, default: ""
      t.string :encrypted_password, null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

      # Rememberable　コメントアウト外した
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
