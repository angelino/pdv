class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :user
      t.references :point_of_sale

      t.timestamps null: false
    end
  end
end
