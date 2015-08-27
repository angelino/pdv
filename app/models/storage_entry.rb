class StorageEntry < ActiveRecord::Base
  validates :movement_date, presence: true
  validates :product, presence: true
  validates :point_of_sale, presence: true
  validates :quantity, presence: true
  validates :storage_entry_type, presence: true

  belongs_to :point_of_sale
  belongs_to :product
  belongs_to :storage_entry_type
end
