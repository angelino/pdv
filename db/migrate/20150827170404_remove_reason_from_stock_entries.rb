class RemoveReasonFromStockEntries < ActiveRecord::Migration
  def change
    remove_column :storage_entries, :reason
  end
end
