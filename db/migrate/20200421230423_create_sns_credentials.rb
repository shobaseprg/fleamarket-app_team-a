class CreateSnsCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :sns_credentials do |t|
      t.string :provider
      t.string :uid
      t.references :user, foreign_key: { to_table: :users } 

      t.timestamps
    end
  end
end
