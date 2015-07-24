class CreateSaleEntries < ActiveRecord::Migration
  def change
    create_table :sale_entries do |t|
      t.references :sale, index: true, foreign_key: true
      t.references :storage_entry, index: true, foreign_key: true
      t.integer :quantity
      t.decimal :price_at_date

      t.timestamps null: false
    end
  end
end
