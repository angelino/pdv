class RemovePublicIdFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :public_id, :string
  end
end
