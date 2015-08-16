class AddForeignKeyToStorageEntriesAndProducts < ActiveRecord::Migration
  def change
    add_foreign_key :storage_entries, :products
  end
end
