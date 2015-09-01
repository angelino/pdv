class CreateFinancialAccounts < ActiveRecord::Migration
  def change
    create_table :financial_accounts do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
