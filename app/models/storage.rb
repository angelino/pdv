class StorageItem
  attr_reader :product, :quantity

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end
end

class Storage

  def initialize(point_of_sale_id:)
    @point_of_sale_id = point_of_sale_id
  end

  def items
    product_ids.collect { |product_id| build_item(product_id) }
  end

  private

  def point_of_sale
    @point_of_sale ||= PointOfSale.find(@point_of_sale_id)
  end

  def storage_entries
    point_of_sale.storage_entries
  end

  def product_ids
    storage_entries.collect { |entry| entry.product_id }.uniq
  end

  def build_item(product_id)
    # FIXME:
    product = Product.find(product_id)
    quantity = product.quantity(point_of_sale)

    StorageItem.new(product, quantity)
  end

end
