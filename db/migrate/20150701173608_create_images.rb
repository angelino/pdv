class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :owner, polymorphic: true, index: true
      t.string :public_id

      t.timestamps null: false
    end
  end
end
