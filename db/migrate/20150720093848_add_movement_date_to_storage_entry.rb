class AddMovementDateToStorageEntry < ActiveRecord::Migration
  def change
    add_column :storage_entries, :movement_date, :date
  end
end
