class AddForeignKeyToSalesAndPointOfSales < ActiveRecord::Migration
  def change
    add_foreign_key :sales, :point_of_sales
  end
end
