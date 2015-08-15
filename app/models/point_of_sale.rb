class PointOfSale < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :storage_entries
  # TODO: Is it possible filter by quantity?
  # has_many :products, through: :storage_entries
  has_many :sales

end
