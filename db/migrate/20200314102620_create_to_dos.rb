class CreateToDos < ActiveRecord::Migration[5.0]
  def change
    create_table :to_dos do |t|
      # t.text :to_do_list
      # t.integer :todo_status, null: false
      # t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end

