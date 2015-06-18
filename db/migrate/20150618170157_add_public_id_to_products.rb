class AddPublicIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :public_id, :string
  end
end
