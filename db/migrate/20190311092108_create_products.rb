class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :photo
      t.float :price
      t.string :time

      t.timestamps
    end
  end
end
