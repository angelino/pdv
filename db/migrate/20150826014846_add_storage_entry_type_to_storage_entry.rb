class AddStorageEntryTypeToStorageEntry < ActiveRecord::Migration
  def change
    add_reference :storage_entries, :storage_entry_type, index: true, foreign_key: true
  end
end
