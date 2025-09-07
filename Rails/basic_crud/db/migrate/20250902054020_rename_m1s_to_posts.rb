class RenameM1sToPosts < ActiveRecord::Migration[8.0]
  def change
    rename_table :m1s, :posts  
  end
end
