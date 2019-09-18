class ChangeDefaultForVeterans < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :veteran, from: nil, to: false
  end
end
