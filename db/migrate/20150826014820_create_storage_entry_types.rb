class CreateStorageEntryTypes < ActiveRecord::Migration
  def change
    create_table :storage_entry_types do |t|
      t.string :reason
      t.boolean :plus_minus_marker
      t.boolean :sell_marker

      t.timestamps null: false
    end
  end
end
