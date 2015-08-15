class SaleEntry < ActiveRecord::Base
  belongs_to :sale
  belongs_to :storage_entry
  has_one :product, through: :storage_entry
end
