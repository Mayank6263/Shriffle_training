class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|

      t.references :midiator, polymorphic: true, null: false
      t.date :joined
      t.timestamps
    end
  end
end
