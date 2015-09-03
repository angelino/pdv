class Sale < ActiveRecord::Base
  validates :saller, presence: true
  validates :point_of_sale, presence: true

  belongs_to :saller, class_name: 'User', foreign_key: 'user_id'
  belongs_to :point_of_sale
  has_many :sale_entries, dependent: :destroy

  scope :on_period, lambda{|start_date, end_date| where('created_at >= ? and created_at <= ?', start_date, end_date)}
  scope :complete, -> { includes(sale_entries: :product) }

  def value
    self.sale_entries.collect{|sale_entry| sale_entry.value}.sum
  end
end
