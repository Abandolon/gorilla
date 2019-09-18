class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :description, :text
    add_column :users, :photo, :string
    add_column :users, :veteran, :boolean
    add_reference :users, :gym, foreign_key: true
  end
end
