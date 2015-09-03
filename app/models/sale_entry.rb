class SaleEntry < ActiveRecord::Base
  validates :sale, presence: true
  validates :storage_entry, presence: true
  validates :price_at_date, presence: true
  validates :quantity, presence: true

  belongs_to :sale
  belongs_to :storage_entry, dependent: :destroy
  has_one :product, through: :storage_entry

  def value
    price_at_date * quantity
  end
end
