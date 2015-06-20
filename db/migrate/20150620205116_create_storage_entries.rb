class CreateStorageEntries < ActiveRecord::Migration
  def change
    create_table :storage_entries do |t|
      t.string :reason
      t.integer :quantity
      t.references :point_of_sale, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
