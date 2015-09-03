class PointOfSale < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :storage_entries, dependent: :restrict_with_error
  has_many :sales, dependent: :restrict_with_error
  has_many :account_entries, through: :sales
end
