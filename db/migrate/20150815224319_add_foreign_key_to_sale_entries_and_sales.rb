class AddForeignKeyToSaleEntriesAndSales < ActiveRecord::Migration
  def change
    add_foreign_key :sale_entries, :sales
  end
end
