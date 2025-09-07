class RemoveQuantityFromProduct < ActiveRecord::Migration[8.0]
  def change
    remove_column :products, :quantity, :string
  end
end
