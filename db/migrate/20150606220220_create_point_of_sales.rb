class CreatePointOfSales < ActiveRecord::Migration
  def change
    create_table :point_of_sales do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
