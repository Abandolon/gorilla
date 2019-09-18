class AddAnswersToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pirate, :boolean
    add_column :users, :beach, :boolean
    add_column :users, :summer, :boolean
    add_column :users, :book, :boolean
    add_column :users, :vegetable, :boolean
    add_column :users, :bicycle, :boolean
  end
end
