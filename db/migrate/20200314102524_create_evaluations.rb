class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references :user, null: false, foreign_key: true
      t.text :text
      t.integer :rank, null: false
      t.timestamps
    end
  end
end
