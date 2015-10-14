class StorageEntry < ActiveRecord::Base
  scope :by_reason, lambda{|reason_id| where(storage_entry_type_id: reason_id)}
  scope :by_product, lambda {|product_id| where(product_id: product_id)}
  scope :by_movement_date, lambda { |min_date, max_date|
    where('storage_entries.movement_date >= ? and storage_entries.movement_date <= ?', min_date.to_date, max_date.to_date)
  }

  validates :movement_date, presence: true
  validates :product, presence: true
  validates :point_of_sale, presence: true
  validates :quantity, presence: true
  validates :storage_entry_type, presence: true

  belongs_to :point_of_sale
  belongs_to :product
  belongs_to :storage_entry_type
end
