class Sale < ActiveRecord::Base
  validates :saller, presence: true
  validates :point_of_sale, presence: true

  belongs_to :saller, class_name: 'User', foreign_key: 'user_id'
  belongs_to :point_of_sale
  has_many :sale_entries, dependent: :destroy

  def value
    self.sale_entries.collect{|sale_entry| sale_entry.quantity * sale_entry.price_at_date}.sum
  end
end
