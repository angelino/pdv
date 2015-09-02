class CreateAccountEntries < ActiveRecord::Migration
  def change
    create_table :account_entries do |t|
      t.decimal :value, precision: 8, scale: 2
      t.date :date
      t.references :origin, polymorphic: true, index: true
      t.references :financial_account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
