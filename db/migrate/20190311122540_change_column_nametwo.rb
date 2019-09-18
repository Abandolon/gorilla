class ChangeColumnNametwo < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :product_id
    add_reference :bookings, :gift, foreign_key: true
  end
end
