class AccountEntry < ActiveRecord::Base
  validates_presence_of :financial_account_id, :message => "deve vincular a conta financeira."

  belongs_to :origin, polymorphic: true
  belongs_to :financial_account
end
