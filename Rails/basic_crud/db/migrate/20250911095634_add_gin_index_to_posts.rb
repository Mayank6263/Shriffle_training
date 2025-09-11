class AddGinIndexToPosts < ActiveRecord::Migration[8.0]
  def change
    add_index :posts, :data_jsonb, using: :gin
  end
end
