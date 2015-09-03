class AccountEntry < ActiveRecord::Base
  validates_presence_of :financial_account_id, :message => "deve vincular a conta financeira."

  belongs_to :origin, polymorphic: true
  belongs_to :sale, :class_name => "Sale", :foreign_key => "origin_id"
  has_one :point_of_sale, through: :sale
  belongs_to :financial_account

  scope :from_account, lambda { |account_id| where(:financial_account_id => account_id) }
  scope :from_point_of_sale, lambda { |pos_id| where('sales.point_of_sale_id = ?', pos_id) }
  scope :on_period, lambda{|start_date, end_date| where('date >= ? and date <= ?', start_date, end_date)}
  scope :complete, -> { includes(sale: :point_of_sale).includes(:financial_account) }
end
