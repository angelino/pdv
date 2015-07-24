class SaleEntry < ActiveRecord::Base
  belongs_to :sale
  belongs_to :storage_entry
end
