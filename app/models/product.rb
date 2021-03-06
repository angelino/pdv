class Product < ActiveRecord::Base
  validates :name, :barcode, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true

  has_many :storage_entries, dependent: :restrict_with_error
  has_many :images, as: :owner, dependent: :destroy

  accepts_nested_attributes_for :images

  # FIXME: Rewrite with scopes
  def quantity(point_of_sale=nil)
    storage_entries = self.storage_entries
    storage_entries = storage_entries.where(point_of_sale_id: point_of_sale.id) if point_of_sale
    storage_entries.sum(:quantity)
  end
end
