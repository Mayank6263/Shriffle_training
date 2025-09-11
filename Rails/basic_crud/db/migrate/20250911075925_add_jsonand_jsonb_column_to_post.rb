class AddJsonandJsonbColumnToPost < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :data_json, :json, default: {}
    add_column :posts, :data_jsonb, :jsonb, default: {}
  end
end
