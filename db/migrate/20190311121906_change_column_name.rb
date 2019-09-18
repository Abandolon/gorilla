class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :product_id
    add_reference :users, :gift, foreign_key: true
  end
end
