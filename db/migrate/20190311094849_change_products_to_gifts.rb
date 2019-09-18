class ChangeProductsToGifts < ActiveRecord::Migration[5.2]
  def change
    rename_table :products, :gifts
  end
end
