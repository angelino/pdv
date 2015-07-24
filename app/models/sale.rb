class Sale < ActiveRecord::Base
  has_many :sale_entries
end
