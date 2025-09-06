class CreateM1s < ActiveRecord::Migration[8.0]
  def change
    create_table :m1s do |t|
      t.string :p1
      t.string :p2

      t.timestamps
    end
  end
end
