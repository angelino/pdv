class AddForeignKeyToStorageEntriesAndPointOfSales < ActiveRecord::Migration
  def change
    add_foreign_key :storage_entries, :point_of_sales
  end
end
