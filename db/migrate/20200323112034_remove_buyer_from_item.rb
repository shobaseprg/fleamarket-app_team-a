class RemoveBuyerFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_reference :items, :buyer, foreign_key: { to_table: :users }
  end
end
