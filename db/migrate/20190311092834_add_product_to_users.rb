class AddProductToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :product, foreign_key: true
  end
end
