class StorageEntry < ActiveRecord::Base
  validates :movement_date, presence: true
  validates :product, presence: true
  validates :point_of_sale, presence: true
  validates :quantity, presence: true
  validates :reason, presence: true

  belongs_to :point_of_sale
  belongs_to :product
end
