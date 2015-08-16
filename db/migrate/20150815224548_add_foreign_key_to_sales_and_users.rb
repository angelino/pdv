class AddForeignKeyToSalesAndUsers < ActiveRecord::Migration
  def change
    add_foreign_key :sales, :users
  end
end
