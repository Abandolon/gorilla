class AddPhotoToStyles < ActiveRecord::Migration[5.2]
  def change
    add_column :styles, :photo, :string
  end
end
