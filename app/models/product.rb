class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true

  has_many :storage_entries
end
